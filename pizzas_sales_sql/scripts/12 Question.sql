--Analyze the cumulative revenue generated over time.

 select
	date,
	sum (revenue) over (order by date) as cum_revenue
from (
	SELECT
	o.date,
	sum(od.quantity*p.price) as revenue
FROM orders o
left join order_details od
on od.order_id =o.order_id
left join pizzas p
on p.pizza_id =od.pizza_id
group by o.date) as sales
