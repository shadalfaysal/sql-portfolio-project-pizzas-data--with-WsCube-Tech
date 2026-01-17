--Question :Calculate the percentage contribution of each pizza type to total revenue.

with total_revenue_cte as  (
select
	round(sum(od.quantity*p.price),2) as total_revenue
from pizzas p 
left join order_details od
on p.pizza_id = od.pizza_id
)
--main quary
 select
	pt.category,
	round((Sum(od.quantity*p.price)/tr.total_revenue)*100,2) as revenue_percentage
 from pizzas p 
left join order_details od
on p.pizza_id = od.pizza_id
left join pizza_types pt
on pt.pizza_type_id = p.pizza_type_id
cross join total_revenue_cte tr
group by pt.category, tr.total_revenue
order by revenue_percentage desc
