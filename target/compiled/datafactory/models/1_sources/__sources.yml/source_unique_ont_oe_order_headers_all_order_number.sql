
    
    

select
    order_number as unique_field,
    count(*) as n_records

from apps.oe_order_headers_all
where order_number is not null
group by order_number
having count(*) > 1


