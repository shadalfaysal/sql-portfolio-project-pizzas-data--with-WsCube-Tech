--Group the orders by date and calculate the average number of pizzas ordered per day.

select 
AVG(total_quantity) as avg_pizza_od_per_day
from (
	select
	o.date,
	sum(od.quantity) as total_quantity
	from orders o
	left join order_details od
	on o.order_id = od.order_id
	group by o.date
) as order_quantity

