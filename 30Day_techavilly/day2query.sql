use [Pizza DB]
-- day 2 challenge
--Using the Pizza Data, write a query to show how many Pizzas were ordered
select
	count (*) as total_pizzas_ordered
from dbo.customer_orders
