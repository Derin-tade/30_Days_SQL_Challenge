USE MovieSuperstore;

select * from Orders;

select  
	city, 
	avg(DATEDIFF(DAY,[Order Date],[Ship Date])) as delivery_day 
from 
	Orders
where city in ('Dallas','Los Angeles', 'Seattle', 'Madison')
group by city
order by delivery_day desc;

--CTE1
with avg_days as
				(select  
					city, 
					avg(DATEDIFF(DAY,[Order Date],[Ship Date])) as delivery_day 
				from 
					Orders
				group by city)
select * 
from 
	avg_days 
where 
	city in ('Dallas','Los Angeles', 'Seattle', 'Madison')
order by delivery_day desc;

-- CTE2
with avg_days as
				(select  
					city, 
					DATEDIFF(DAY,[Order Date],[Ship Date]) as date_diff 
				from 
					Orders)
select City, avg(date_diff) as Average_delivery_days
from 
	avg_days 
where 
	city in ('Dallas','Los Angeles', 'Seattle', 'Madison')
group by city
order by Average_delivery_days desc;


-- using subqueries
select city, avg(date_diff) as "Average delivery days"
from (select city, datediff(day, [Order Date],[Ship Date]) as date_diff 
				from 
					Orders) as avg_days
where city in ('Dallas','Los Angeles', 'Seattle', 'Madison')
group by city
order by city;
