--03 Identify the highest-priced pizza
SELECT p.price,
        pt.name
FROM Pizzas p
LEFT JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE p.price = (SELECT MAX(price) FROM Pizzas);  

-- 2nd tips
select 
p.price,
pt.name
from pizzas p 
left join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
order by price desc limit 1
