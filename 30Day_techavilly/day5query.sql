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

-- Using Subqueries
select 
	pizza_name, 
	COUNT(*) as pizza_deliveries
from 
	customer_orders co 
	join 
	pizza_names pz 
	on 
	co.pizza_id=pz.pizza_id 
where co.order_id in (select ro.order_id
						from runner_orders ro 
						where ro.cancellation is null)
group by pizza_name;


-- Using CTE
with pizruncust as 
(select pz.pizza_id, pz.pizza_name from pizza_names pz
left join
customer_orders co on
pz.pizza_id=co.pizza_id
join
runner_orders ro on
co.order_id=ro.order_id
where ro.cancellation is null)

select 
pizza_name, count(*) as pizza_deliveries from pizruncust
group by pizza_name
order by pizza_name;