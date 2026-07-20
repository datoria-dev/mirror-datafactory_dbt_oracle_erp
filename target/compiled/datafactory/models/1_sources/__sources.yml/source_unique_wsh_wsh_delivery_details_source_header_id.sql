
    
    

select
    source_header_id as unique_field,
    count(*) as n_records

from apps.wsh_delivery_details
where source_header_id is not null
group by source_header_id
having count(*) > 1


