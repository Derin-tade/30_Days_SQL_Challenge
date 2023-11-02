USE moviesuperstore;

SELECT *
FROM Orders;

SELECT *
FROM Returning;

SELECT TOP 5 Product_Name,
	Product_ID,
	count(Product_ID) AS Product_count
FROM (
	SELECT r.*,
		o.[product name] AS Product_Name,
		o.[product id] AS Product_ID
	FROM Returning r
	INNER JOIN Orders o ON r.[Order ID] = o.[Order ID]
	) AS sub_q
GROUP BY Product_ID,
	Product_Name
ORDER BY Product_count DESC;

--CTE
WITH cte
AS (
	SELECT r.*,
		o.[product name] AS Product_Name,
		o.[product id] AS Product_ID
	FROM Returning r
	INNER JOIN Orders o ON r.[Order ID] = o.[Order ID]
	)
SELECT TOP 5 Product_Name,
	Product_ID,
	count(Product_ID) AS Product_count
FROM cte
GROUP BY Product_ID,
	Product_Name
ORDER BY Product_count DESC