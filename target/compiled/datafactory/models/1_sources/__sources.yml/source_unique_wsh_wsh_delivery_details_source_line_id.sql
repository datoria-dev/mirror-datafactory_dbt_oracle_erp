
    
    

select
    source_line_id as unique_field,
    count(*) as n_records

from apps.wsh_delivery_details
where source_line_id is not null
group by source_line_id
having count(*) > 1


