-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
    round((SUM(orders_details.quantity * pizzas.price)   / (Select 
round(sum(orders_details.quantity *pizzas.price),2)
 as total_revenue
from orders_details
join pizzas
on orders_details.pizza_id = pizzas.pizza_id)) * 100,2) as revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.category
order by revenue;