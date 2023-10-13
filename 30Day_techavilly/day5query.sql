USE [Pizza DB]
-- day 5 challenge
--Using the Pizza Data, write a query to show the number of each type of pizza was delivered
SELECT
	pizza_name,
	COUNT(*) AS pizza_deliveries
FROM
	runner_orders ro
	JOIN
	customer_orders co ON ro.order_id=co.order_id
	JOIN
	pizza_names pn ON co.pizza_id=pn.pizza_id
WHERE ro.cancellation IS NULL
GROUP BY pizza_name;


select*from runner_orders;
select*from pizza_names;
select*from customer_orders;
select*from pizza_recipes;
select*from runners;
