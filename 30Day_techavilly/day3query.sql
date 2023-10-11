use [Pizza DB]
-- day 3 challenge
--Using the Pizza Data, write a query to show how many successful orders were delivered by each runner
select 
	runner_id,
	count(*) as number_of_successful_orders
from 
	runner_orders
where 
	cancellation is NULL
group by runner_id
order by number_of_successful_orders desc;

