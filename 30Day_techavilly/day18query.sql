use moviesuperstore;

select * from Orders;
select * from Returned;


select State, sum(sales) as total from Orders group by State order by total desc;


SELECT state,
	avg(datediff(day, [order date], [ship date])) AS AvgDaysBetweenOrderAndShip
FROM Orders
GROUP BY state
ORDER BY AvgDaysBetweenOrderAndShip;