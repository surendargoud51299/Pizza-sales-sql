#Calculate the percentage contribution of each pizza type to total revenue.

###category wise revenue###
#select pizza_types.category, sum(order_details.quantity*pizzas.price) as revenue
#from pizza_types join pizzas 
#on pizza_types.pizza_type_id = pizzas.pizza_type_id
#join order_details
#on order_details.pizza_id = pizzas.pizza_id
#group by pizza_types.category order by revenue desc ;


SELECT 
    pizza_types.category,
    ROUND(SUM(order_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(order_details.quantity * pizzas.price),
                                2) AS total_sales
                FROM
                    order_details
                        JOIN
                    pizzas ON pizzas.pizza_id = order_details.pizza_id) * 100,
            2) AS revenue_percentage
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC;