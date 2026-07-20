
    
    

select
    header_id as unique_field,
    count(*) as n_records

from apps.oe_order_headers_all
where header_id is not null
group by header_id
having count(*) > 1


