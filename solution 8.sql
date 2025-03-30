#Join relevant tables to find the category-wise distribution of pizzas.

select pizza_types.category , count(pizza_types.name) from pizza_types
group by category