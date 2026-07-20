#!/usr/bin/env python3
"""Generate static Tableau workbook documentation from local TWB/TWBX files."""

from __future__ import annotations

import json
import re
import shutil
import sys
import zipfile
from collections import defaultdict
from pathlib import Path
from xml.etree import ElementTree as ET


ROOT = Path("/Users/aguerra/Documents/datafactory_dbt_oracle_erp")
WORKBOOK_DIR = ROOT / "tableau" / "my-tableau-dashboards"
SCREENSHOT_DIR = ROOT / "tableau" / "my-tableau-screenshots"
OUTPUT_DIR = ROOT / "docs" / "tableau_workbook_analysis"
LINEAGE_DIRS = [
    ROOT / "models",
    ROOT / "seeds",
    ROOT / "analyses",
    ROOT / "knowledgebase" / "tableau",
]

REQUIRED_HEADINGS = [
    "## Tabular Report",
    "## Table of Contents",
    "## Datasources and Relations",
    "### Likely dbt / SQL or Seed Lineage Guess",
    "## Sheet Inventory",
    "### Filter Cards and Visible Controls",
    "### Primary Worksheet Shelves and Marks",
    "### Worksheet Filters and Selections",
    "### Fields Used by Primary Worksheet",
    "## Calculations",
    "### Calculated Fields",
    "### Calculation Field Dependencies",
    "### Calculation Lineage Notes",
    "### LOD and Table Calculation Summary",
    "## Color and Legend Notes",
]

FORBIDDEN_HEADINGS = {
    "## File Structure",
    "## Guardrails",
    "## Items Not Recoverable from Static XML Alone",
    "## Static Analysis Boundary",
    "## Purpose",
    "## Notes",
    "## Workbook Metadata",
    "## Dashboard Composition",
    "## Workbook Dashboard Inventory",
    "## Required Workbook Doc Structure",
}

TABLE_CALC_PATTERNS = (
    "WINDOW_",
    "LOOKUP(",
    "RUNNING_",
    "INDEX(",
    "SIZE(",
    "FIRST(",
    "LAST(",
    "RANK(",
    "TOTAL(",
    "PREVIOUS_VALUE(",
)


def slugify(value: str) -> str:
    value = re.sub(r"([a-z0-9])([A-Z])", r"\1-\2", value)
    value = re.sub(r"[^A-Za-z0-9]+", "-", value).strip("-")
    value = re.sub(r"-{2,}", "-", value)
    return value.lower() or "tableau-workbook"


def norm(value: str) -> str:
    return re.sub(r"[^a-z0-9]+", "", value.lower())


def tokens(value: str) -> set[str]:
    words = re.findall(r"[A-Za-z0-9]+", re.sub(r"([a-z0-9])([A-Z])", r"\1 \2", value))
    return {w.lower() for w in words if len(w) > 1 and w.lower() not in {"prod", "the", "and", "for"}}


def rel(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def cell(value: object) -> str:
    text = "" if value is None else str(value)
    text = re.sub(r"\s+", " ", text).strip()
    text = text.replace("|", r"\|")
    text = text.replace("`", "'")
    return text or "-"


def short(value: object, limit: int = 220) -> str:
    text = cell(value)
    if len(text) <= limit:
        return text
    return text[: limit - 3].rstrip() + "..."


def clean_field(value: str | None) -> str:
    if not value:
        return "-"
    text = re.sub(r"^\[[^\]]+\]\.", "", value)
    return text.strip()


def load_workbook_xml(path: Path) -> tuple[ET.Element, str]:
    if path.suffix.lower() == ".twbx":
        with zipfile.ZipFile(path) as package:
            candidates = [
                name
                for name in package.namelist()
                if name.lower().endswith(".twb") and not name.startswith("__MACOSX/")
            ]
            if not candidates:
                raise ValueError(f"No .twb found in {path}")
            twb_name = sorted(candidates, key=len)[0]
            return ET.fromstring(package.read(twb_name)), twb_name
    return ET.fromstring(path.read_bytes()), path.name


def lineage_files() -> list[Path]:
    files: list[Path] = []
    for base in LINEAGE_DIRS:
        if not base.exists():
            continue
        for pattern in ("*.sql", "*.csv", "*.md", "*.json", "*.yml", "*.yaml"):
            files.extend(base.rglob(pattern))
    return sorted(set(files))


def lineage_matches(queries: list[str], files: list[Path], limit: int = 10) -> list[dict[str, object]]:
    query_tokens = set().union(*(tokens(q) for q in queries if q))
    query_norms = [norm(q) for q in queries if q]
    scored: list[tuple[float, Path, str]] = []
    for path in files:
        stem = path.stem
        stem_norm = norm(stem)
        stem_tokens = tokens(stem)
        score = 0.0
        reason_parts: list[str] = []
        for qn in query_norms:
            if not qn:
                continue
            if qn == stem_norm:
                score += 100
                reason_parts.append("exact normalized name")
            elif qn in stem_norm or stem_norm in qn:
                score += 45
                reason_parts.append("normalized substring")
        overlap = query_tokens & stem_tokens
        if overlap:
            score += len(overlap) * 8
            reason_parts.append("shared tokens: " + ", ".join(sorted(overlap)[:8]))
        if score:
            scored.append((score, path, "; ".join(dict.fromkeys(reason_parts))))
    scored.sort(key=lambda item: (-item[0], rel(item[1])))
    return [
        {"path": rel(path), "score": round(score, 1), "reason": reason}
        for score, path, reason in scored[:limit]
    ]


def screenshot_map() -> dict[str, Path]:
    return {norm(path.stem): path for path in sorted(SCREENSHOT_DIR.glob("*.jpeg"))}


def best_screenshot(workbook_name: str, dashboards: list[str], screenshots: dict[str, Path]) -> Path | None:
    for name in dashboards + [workbook_name]:
        key = norm(name)
        if key in screenshots:
            return screenshots[key]
    for name in dashboards + [workbook_name]:
        key = norm(name)
        for shot_key, path in screenshots.items():
            if key and (key in shot_key or shot_key in key):
                return path
    return None


def datasource_label(datasource: ET.Element) -> str:
    return datasource.attrib.get("caption") or datasource.attrib.get("name") or "Unnamed datasource"


def unique_datasources(root: ET.Element) -> list[dict[str, object]]:
    seen: set[tuple[str, str]] = set()
    datasources: list[dict[str, object]] = []
    for datasource in root.findall(".//datasource"):
        name = datasource.attrib.get("name") or ""
        caption = datasource.attrib.get("caption") or ""
        key = (name, caption)
        if key in seen:
            continue
        seen.add(key)
        relations = []
        for relation in datasource.findall(".//relation"):
            relation_name = relation.attrib.get("name") or relation.attrib.get("table") or relation.attrib.get("type")
            if relation_name:
                relations.append(
                    {
                        "name": relation_name,
                        "table": relation.attrib.get("table", ""),
                        "type": relation.attrib.get("type", ""),
                    }
                )
        datasources.append(
            {
                "name": name,
                "caption": caption,
                "label": caption or name or "Unnamed datasource",
                "relations": relations,
            }
        )
    return datasources


def workbook_cards(root: ET.Element) -> list[dict[str, str]]:
    cards: list[dict[str, str]] = []
    for card in root.findall(".//card"):
        attrs = {k: v for k, v in card.attrib.items() if k in {"type", "mode", "param", "pane-specification-id"}}
        card_type = attrs.get("type", "")
        param = attrs.get("param", "")
        if "filter" in card_type.lower() or card_type.lower() in {"color", "legend", "size", "shape"} or param:
            cards.append(attrs)
    dedup: list[dict[str, str]] = []
    seen: set[str] = set()
    for item in cards:
        key = json.dumps(item, sort_keys=True)
        if key not in seen:
            seen.add(key)
            dedup.append(item)
    return dedup


def worksheet_info(root: ET.Element) -> list[dict[str, object]]:
    worksheets: list[dict[str, object]] = []
    for worksheet in root.findall(".//worksheet"):
        name = worksheet.attrib.get("name") or "Unnamed worksheet"
        ds_names = []
        fields = []
        for deps in worksheet.findall(".//datasource-dependencies"):
            ds_name = deps.attrib.get("datasource")
            if ds_name:
                ds_names.append(ds_name)
            for column in deps.findall(".//column"):
                field_name = column.attrib.get("caption") or column.attrib.get("name")
                if field_name:
                    fields.append(clean_field(field_name))
        filters = []
        for filt in worksheet.findall(".//filter"):
            filters.append(
                {
                    "class": filt.attrib.get("class", ""),
                    "column": clean_field(filt.attrib.get("column")),
                    "groupfilter": filt.attrib.get("groupfilter", ""),
                }
            )
        encodings = []
        color_fields = []
        for enc in worksheet.findall(".//encoding"):
            attr = enc.attrib.get("attr", "")
            column = clean_field(enc.attrib.get("column"))
            if attr or column != "-":
                encodings.append({"attr": attr, "column": column})
            if attr == "color" and column != "-":
                color_fields.append(column)
        rows = [clean_field(elem.text) for elem in worksheet.findall(".//rows") if elem.text]
        cols = [clean_field(elem.text) for elem in worksheet.findall(".//cols") if elem.text]
        marks = []
        for mark in worksheet.findall(".//mark"):
            mark_class = mark.attrib.get("class")
            if mark_class:
                marks.append(mark_class)
        worksheets.append(
            {
                "name": name,
                "datasources": sorted(set(ds_names)),
                "fields": sorted(set(fields)),
                "filters": filters,
                "encodings": encodings,
                "color_fields": sorted(set(color_fields)),
                "rows": rows,
                "cols": cols,
                "marks": sorted(set(marks)),
            }
        )
    return worksheets


def calculations(root: ET.Element) -> list[dict[str, object]]:
    calcs: list[dict[str, object]] = []
    seen: set[tuple[str, str, str]] = set()
    for datasource in root.findall(".//datasource"):
        source = datasource_label(datasource)
        for column in datasource.findall(".//column"):
            calc = column.find(".//calculation")
            if calc is None:
                continue
            formula = calc.attrib.get("formula") or ""
            name = column.attrib.get("caption") or column.attrib.get("name") or "Unnamed calculation"
            key = (source, name, formula)
            if key in seen:
                continue
            seen.add(key)
            formula_upper = formula.upper()
            deps = sorted(set(re.findall(r"\[([^\]]+)\]", formula)))
            calcs.append(
                {
                    "name": clean_field(name),
                    "datasource": source,
                    "class": calc.attrib.get("class", ""),
                    "formula": formula,
                    "dependencies": deps,
                    "is_lod": "{" in formula and "}" in formula and any(k in formula_upper for k in ("FIXED", "INCLUDE", "EXCLUDE")),
                    "is_table_calc": any(pattern in formula_upper for pattern in TABLE_CALC_PATTERNS),
                }
            )
    return calcs


def toc() -> str:
    items = [
        ("Tabular Report", "tabular-report"),
        ("Datasources and Relations", "datasources-and-relations"),
        ("Likely dbt / SQL or Seed Lineage Guess", "likely-dbt--sql-or-seed-lineage-guess"),
        ("Sheet Inventory", "sheet-inventory"),
        ("Filter Cards and Visible Controls", "filter-cards-and-visible-controls"),
        ("Primary Worksheet Shelves and Marks", "primary-worksheet-shelves-and-marks"),
        ("Worksheet Filters and Selections", "worksheet-filters-and-selections"),
        ("Fields Used by Primary Worksheet", "fields-used-by-primary-worksheet"),
        ("Calculations", "calculations"),
        ("Calculated Fields", "calculated-fields"),
        ("Calculation Field Dependencies", "calculation-field-dependencies"),
        ("Calculation Lineage Notes", "calculation-lineage-notes"),
        ("LOD and Table Calculation Summary", "lod-and-table-calculation-summary"),
        ("Color and Legend Notes", "color-and-legend-notes"),
    ]
    return "\n".join(f"- [{label}](#{anchor})" for label, anchor in items)


def dashboard_names(root: ET.Element) -> list[str]:
    names = []
    for dashboard in root.findall(".//dashboard"):
        name = dashboard.attrib.get("name")
        if name and name not in names:
            names.append(name)
    return names


def primary_dashboard(workbook_path: Path, dashboards: list[str], shot: Path | None) -> str:
    if shot:
        shot_key = norm(shot.stem)
        for name in dashboards:
            if norm(name) == shot_key:
                return name
    for name in dashboards:
        if not name.lower().startswith("forlegend"):
            return name
    return dashboards[0] if dashboards else workbook_path.stem


def render_datasources(datasources: list[dict[str, object]]) -> str:
    lines = ["| Datasource | Internal name | Relations found |", "| --- | --- | --- |"]
    for ds in datasources:
        relations = ds["relations"]
        relation_text = ", ".join(
            short(r.get("table") or r.get("name") or r.get("type"), 80) for r in relations[:8]
        )
        if len(relations) > 8:
            relation_text += f", +{len(relations) - 8} more"
        lines.append(f"| `{cell(ds['label'])}` | `{cell(ds['name'])}` | {cell(relation_text)} |")
    return "\n".join(lines) if len(lines) > 2 else "No datasource elements were recovered from the workbook XML."


def render_lineage(matches: list[dict[str, object]]) -> str:
    if not matches:
        return "No likely dbt, SQL, seed, or knowledgebase matches were found by static filename matching."
    lines = ["| Likely file | Match score | Static reason |", "| --- | ---: | --- |"]
    for match in matches:
        lines.append(f"| `{cell(match['path'])}` | {match['score']} | {cell(match['reason'])} |")
    return "\n".join(lines)


def render_sheet_inventory(worksheets: list[dict[str, object]]) -> str:
    lines = ["| Worksheet | Datasources | Field count | Filter count | Marks |", "| --- | --- | ---: | ---: | --- |"]
    for ws in worksheets:
        lines.append(
            f"| `{cell(ws['name'])}` | {cell(', '.join(ws['datasources']))} | {len(ws['fields'])} | {len(ws['filters'])} | {cell(', '.join(ws['marks']))} |"
        )
    return "\n".join(lines) if len(lines) > 2 else "No worksheets were recovered from the workbook XML."


def render_cards(cards: list[dict[str, str]]) -> str:
    if not cards:
        return "No visible filter or legend card elements were recovered from static workbook XML."
    lines = ["| Type | Parameter / field | Mode |", "| --- | --- | --- |"]
    for card in cards:
        lines.append(f"| `{cell(card.get('type'))}` | `{cell(clean_field(card.get('param'))).strip('`')}` | {cell(card.get('mode'))} |")
    return "\n".join(lines)


def render_shelves(worksheets: list[dict[str, object]]) -> str:
    lines = ["| Worksheet | Rows | Columns | Marks | Color fields |", "| --- | --- | --- | --- | --- |"]
    for ws in worksheets:
        lines.append(
            f"| `{cell(ws['name'])}` | {cell('; '.join(ws['rows']))} | {cell('; '.join(ws['cols']))} | {cell(', '.join(ws['marks']))} | {cell(', '.join(ws['color_fields']))} |"
        )
    return "\n".join(lines)


def render_filters(worksheets: list[dict[str, object]]) -> str:
    lines = ["| Worksheet | Filter class | Field | Selection / groupfilter |", "| --- | --- | --- | --- |"]
    for ws in worksheets:
        for filt in ws["filters"]:
            lines.append(
                f"| `{cell(ws['name'])}` | `{cell(filt.get('class'))}` | `{cell(filt.get('column'))}` | {cell(filt.get('groupfilter'))} |"
            )
    return "\n".join(lines) if len(lines) > 2 else "No worksheet filter elements were recovered from static workbook XML."


def render_fields(worksheets: list[dict[str, object]]) -> str:
    parts = []
    for ws in worksheets:
        fields = ws["fields"]
        field_text = ", ".join(f"`{cell(field)}`" for field in fields) if fields else "No datasource dependency fields recovered."
        parts.append(f"- `{cell(ws['name'])}`: {field_text}")
    return "\n".join(parts) if parts else "No worksheet fields were recovered from static workbook XML."


def render_calcs(calcs: list[dict[str, object]]) -> str:
    if not calcs:
        return "No calculated fields were recovered from static workbook XML."
    lines = ["| Calculated field | Datasource | Formula |", "| --- | --- | --- |"]
    for calc in calcs:
        lines.append(f"| `{cell(calc['name'])}` | `{cell(calc['datasource'])}` | `{short(calc['formula'], 500)}` |")
    return "\n".join(lines)


def render_calc_deps(calcs: list[dict[str, object]]) -> str:
    if not calcs:
        return "No calculation dependencies were recovered."
    lines = ["| Calculated field | Referenced fields |", "| --- | --- |"]
    for calc in calcs:
        deps = ", ".join(f"`{cell(dep)}`" for dep in calc["dependencies"]) or "-"
        lines.append(f"| `{cell(calc['name'])}` | {deps} |")
    return "\n".join(lines)


def render_calc_notes(calcs: list[dict[str, object]], matches: list[dict[str, object]]) -> str:
    notes = []
    if matches:
        notes.append("Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.")
    else:
        notes.append("Calculation lineage is limited to Tableau XML field references because no likely local dbt or SQL filename match was found.")
    calc_sources = sorted({str(calc["datasource"]) for calc in calcs})
    if calc_sources:
        notes.append("Calculated fields were recovered from: " + ", ".join(f"`{cell(source)}`" for source in calc_sources) + ".")
    return "\n\n".join(notes)


def render_lod_summary(calcs: list[dict[str, object]]) -> str:
    lods = [calc for calc in calcs if calc["is_lod"]]
    table_calcs = [calc for calc in calcs if calc["is_table_calc"]]
    lines = [
        "| Metric | Count | Fields |",
        "| --- | ---: | --- |",
        f"| LOD calculations | {len(lods)} | {cell(', '.join(str(calc['name']) for calc in lods))} |",
        f"| Table calculations | {len(table_calcs)} | {cell(', '.join(str(calc['name']) for calc in table_calcs))} |",
    ]
    return "\n".join(lines)


def render_color_notes(worksheets: list[dict[str, object]], cards: list[dict[str, str]]) -> str:
    lines = ["| Source | Color / legend detail |", "| --- | --- |"]
    for ws in worksheets:
        if ws["color_fields"]:
            lines.append(f"| `{cell(ws['name'])}` | Color encodes {cell(', '.join(ws['color_fields']))} |")
    for card in cards:
        if str(card.get("type", "")).lower() in {"color", "legend"}:
            lines.append(f"| Workbook card | `{cell(card.get('type'))}` for `{cell(clean_field(card.get('param'))).strip('`')}` |")
    return "\n".join(lines) if len(lines) > 2 else "No explicit color encoding or legend card elements were recovered from static workbook XML."


def write_workbook_doc(path: Path, files: list[Path], screenshots: dict[str, Path]) -> dict[str, object]:
    root, embedded_twb = load_workbook_xml(path)
    dashboards = dashboard_names(root)
    worksheets = worksheet_info(root)
    datasources = unique_datasources(root)
    calcs = calculations(root)
    cards = workbook_cards(root)
    shot = best_screenshot(path.stem, dashboards, screenshots)
    primary = primary_dashboard(path, dashboards, shot)
    folder = OUTPUT_DIR / slugify(path.stem)
    folder.mkdir(parents=True, exist_ok=True)
    copied_shot = None
    if shot:
        copied_shot = folder / shot.name
        shutil.copy2(shot, copied_shot)
    query_values = [path.stem, primary] + dashboards + [str(ds["label"]) for ds in datasources]
    matches = lineage_matches(query_values, files)
    doc = "\n\n".join(
        [
            f"# {primary}",
            "## Tabular Report\n\n"
            + "\n".join(
                [
                    "| Attribute | Value |",
                    "| --- | --- |",
                    f"| Source workbook | `{rel(path)}` |",
                    f"| Embedded TWB | `{cell(embedded_twb)}` |",
                    f"| Primary dashboard | `{cell(primary)}` |",
                    f"| Dashboard count | {len(dashboards)} |",
                    f"| Worksheet count | {len(worksheets)} |",
                    f"| Datasource count | {len(datasources)} |",
                    f"| Calculated field count | {len(calcs)} |",
                    f"| LOD calculation count | {sum(1 for calc in calcs if calc['is_lod'])} |",
                    f"| Table calculation count | {sum(1 for calc in calcs if calc['is_table_calc'])} |",
                    f"| Screenshot | `{rel(copied_shot) if copied_shot else 'No matching screenshot found'}` |",
                ]
            ),
            "## Table of Contents\n\n" + toc(),
            "## Datasources and Relations\n\n" + render_datasources(datasources),
            "### Likely dbt / SQL or Seed Lineage Guess\n\n" + render_lineage(matches),
            "## Sheet Inventory\n\n" + render_sheet_inventory(worksheets),
            "### Filter Cards and Visible Controls\n\n" + render_cards(cards),
            "### Primary Worksheet Shelves and Marks\n\n" + render_shelves(worksheets),
            "### Worksheet Filters and Selections\n\n" + render_filters(worksheets),
            "### Fields Used by Primary Worksheet\n\n" + render_fields(worksheets),
            "## Calculations\n\n" + f"Recovered `{len(calcs)}` calculated field definitions from static workbook XML.",
            "### Calculated Fields\n\n" + render_calcs(calcs),
            "### Calculation Field Dependencies\n\n" + render_calc_deps(calcs),
            "### Calculation Lineage Notes\n\n" + render_calc_notes(calcs, matches),
            "### LOD and Table Calculation Summary\n\n" + render_lod_summary(calcs),
            "## Color and Legend Notes\n\n" + render_color_notes(worksheets, cards),
        ]
    )
    (folder / "README.md").write_text(doc + "\n", encoding="utf-8")
    metadata = {
        "source_workbook": rel(path),
        "embedded_twb": embedded_twb,
        "primary_dashboard": primary,
        "dashboards": dashboards,
        "worksheet_count": len(worksheets),
        "datasource_count": len(datasources),
        "calculated_field_count": len(calcs),
        "lod_calculation_count": sum(1 for calc in calcs if calc["is_lod"]),
        "table_calculation_count": sum(1 for calc in calcs if calc["is_table_calc"]),
        "screenshot": rel(copied_shot) if copied_shot else None,
        "likely_lineage_matches": matches,
    }
    (folder / "metadata_summary.json").write_text(json.dumps(metadata, indent=2) + "\n", encoding="utf-8")
    return {"folder": folder, "readme": folder / "README.md", **metadata}


def write_root_index(results: list[dict[str, object]]) -> Path:
    lines = ["| Workbook doc | Primary dashboard | Source workbook | Screenshot |", "| --- | --- | --- | --- |"]
    for result in sorted(results, key=lambda item: str(item["source_workbook"])):
        readme = Path(result["readme"])
        link = readme.parent.name + "/README.md"
        lines.append(
            f"| [{cell(result['primary_dashboard'])}]({link}) | `{cell(result['primary_dashboard'])}` | `{cell(result['source_workbook'])}` | `{cell(result.get('screenshot'))}` |"
        )
    all_matches = []
    for result in results:
        all_matches.extend(result.get("likely_lineage_matches", []))
    unique_match_paths = sorted({str(match["path"]) for match in all_matches})
    doc = "\n\n".join(
        [
            "# Tableau Workbook Analysis",
            "## Tabular Report\n\n" + "\n".join(lines),
            "## Table of Contents\n\n" + toc(),
            "## Datasources and Relations\n\nThis index covers the generated workbook-level README files. Open each workbook doc for datasource and relation details recovered from its local Tableau XML.",
            "### Likely dbt / SQL or Seed Lineage Guess\n\n"
            + (
                "\n".join(f"- `{path}`" for path in unique_match_paths)
                if unique_match_paths
                else "No likely lineage matches were found across the generated workbook docs."
            ),
            "## Sheet Inventory\n\nOpen each workbook doc for worksheet, filter, shelf, mark, and field inventories.",
            "### Filter Cards and Visible Controls\n\nOpen each workbook doc for recovered filter cards and visible controls.",
            "### Primary Worksheet Shelves and Marks\n\nOpen each workbook doc for worksheet shelf and marks details.",
            "### Worksheet Filters and Selections\n\nOpen each workbook doc for worksheet filters and static selections.",
            "### Fields Used by Primary Worksheet\n\nOpen each workbook doc for fields recovered from worksheet datasource dependencies.",
            "## Calculations\n\nOpen each workbook doc for calculated fields recovered from static workbook XML.",
            "### Calculated Fields\n\nOpen each workbook doc for calculation formulas.",
            "### Calculation Field Dependencies\n\nOpen each workbook doc for dependencies parsed from Tableau calculation formulas.",
            "### Calculation Lineage Notes\n\nLineage notes are inferred from local naming conventions and static files only.",
            "### LOD and Table Calculation Summary\n\nOpen each workbook doc for LOD and table-calculation counts.",
            "## Color and Legend Notes\n\nOpen each workbook doc for recovered color encodings and legend card notes.",
        ]
    )
    path = OUTPUT_DIR / "README.md"
    path.write_text(doc + "\n", encoding="utf-8")
    return path


def markdown_headings(path: Path) -> list[str]:
    headings: list[str] = []
    in_fence = False
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("```"):
            in_fence = not in_fence
            continue
        if in_fence:
            continue
        if line.startswith("#"):
            headings.append(line.strip())
    return headings


def validate_markdown(paths: list[Path]) -> list[str]:
    failures: list[str] = []
    for path in paths:
        headings = markdown_headings(path)
        if not headings or not headings[0].startswith("# "):
            failures.append(f"{path}: missing H1")
            continue
        actual = [heading for heading in headings[1:] if heading.startswith("##") or heading.startswith("###")]
        forbidden = sorted(set(actual) & FORBIDDEN_HEADINGS)
        if forbidden:
            failures.append(f"{path}: forbidden headings present: {', '.join(forbidden)}")
        if actual != REQUIRED_HEADINGS:
            failures.append(f"{path}: heading sequence mismatch: {actual}")
    return failures


def main() -> int:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    files = lineage_files()
    screenshots = screenshot_map()
    workbook_paths = sorted(
        path for path in WORKBOOK_DIR.iterdir() if path.suffix.lower() in {".twb", ".twbx"}
    )
    if not workbook_paths:
        print("No Tableau workbook files found.", file=sys.stderr)
        return 1
    results = []
    errors: dict[str, str] = {}
    for path in workbook_paths:
        try:
            results.append(write_workbook_doc(path, files, screenshots))
        except Exception as exc:  # noqa: BLE001
            errors[rel(path)] = str(exc)
    root_readme = write_root_index(results)
    markdown_paths = [root_readme] + [Path(result["readme"]) for result in results]
    failures = validate_markdown(markdown_paths)
    report = {
        "workbook_files_seen": len(workbook_paths),
        "workbook_docs_generated": len(results),
        "generation_errors": errors,
        "markdown_files_validated": len(markdown_paths),
        "validation_failures": failures,
    }
    (OUTPUT_DIR / "validation_report.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, indent=2))
    return 1 if errors or failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
