--Determine the top 3 most ordered pizza types based on revenue for each pizza category.

with revenue_cte as (
select
	pt.category as category,
	pt.name as name,
	round(sum(od.quantity*p.price),2) as revenue
from pizzas p
left join pizza_types pt
on  p.pizza_type_id = pt.pizza_type_id
left join order_details od
on  od.pizza_id = p.pizza_id
group by pt.category,pt.name
),
 rank_cte as (
 SELECT 
	category,
	name,
	revenue,
	RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rn
FROM revenue_cte
)

--main query
select 
 name,
 category,
 revenue,
 rn
from rank_cte
where rn <= 3

	
