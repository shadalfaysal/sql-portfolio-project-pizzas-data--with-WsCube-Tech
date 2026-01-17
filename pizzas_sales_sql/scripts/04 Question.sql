--04 Identify the most common pizza size ordered.
select 
         p.size,
         count(od.order_details_id) as order_count
from order_details od
left join pizzas p
on p.pizza_id = od.pizza_id
group by p.size
order by order_count desc
