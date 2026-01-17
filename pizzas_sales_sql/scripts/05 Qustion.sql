--List the top 5 most ordered pizza types along with their quantities.

select top 5
	pt.name,
	Sum(od.quantity) as total_quantity
from pizza_types pt
left join pizzas p
on pt.pizza_type_id = p.pizza_type_id
left join order_details od
on p.pizza_id = od.pizza_id 
group by pt.name
order by total_quantity desc
