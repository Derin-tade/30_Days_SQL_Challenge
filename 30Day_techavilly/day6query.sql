USE MovieSuperstore;

-- It's getting to the end of the year and the Briggs Company wants to reward the customer who made the highest sales ever.
-- Using the Sample Super Store, write a queryy to help the company identify this customer and category of business driving the sales.
-- Let your output show the customer Name, the Category and the total sales.
-- Round the total sales to the neerest whole number.
SELECT *
FROM Orders;

SELECT *
FROM People;

SELECT *
FROM dbo.Returning;

SELECT *
FROM bank_market_data

-- Solution 1
SELECT [Customer ID]
	,[Customer Name]
	,Category
	,ROUND(SUM([Sales]),0) AS 'Total Sales'
FROM Orders
GROUP BY [Customer ID]
	,[Customer Name]
	,Category
ORDER BY [Total Sales]DESC;
--Solution 2 Using CTE's
WITH cte
AS (
	SELECT [Customer ID]
		,[Customer Name]
		,[Category]
		,ROUND(SUM([Sales]),0) AS 'Total Sales'
	FROM Orders
	GROUP BY [Customer ID]
		,[Customer Name]
		,[Category]
	)
SELECT TOP 1 [Customer Name]
	,[Category]
	,[Total Sales]
FROM cte
ORDER BY [Total Sales] DESC;
-- Solution 3 Using Subqueries
SELECT TOP 1 [Customer Name]
	,[Category]
	,[Total Sales]
FROM (
	SELECT [Customer ID]
		,[Customer Name]
		,[Category]
		,ROUND(SUM([Sales]),0) AS 'Total Sales'
	FROM Orders
	GROUP BY [Customer ID]
		,[Customer Name]
		,[Category]
	) AS querytab1
ORDER BY [Total Sales] DESC;
