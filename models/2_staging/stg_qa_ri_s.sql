select 
src_ri.*,
src_s.*
from {{ ref('src_qa_results_ri') }} src_ri
left join {{ ref('src_ap_suppliers') }} src_s
on src_ri.ri_vendor_id = src_s.s_vendor_id