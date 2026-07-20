
    
    

select
    component_sequence_id as unique_field,
    count(*) as n_records

from apps.bom_components_b
where component_sequence_id is not null
group by component_sequence_id
having count(*) > 1


