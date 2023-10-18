use MovieSuperstore;
-- 2023/10/18
-- After seeing the Sales by Category, the Briggs company became curious, 
-- and wanted to dig deeper to see which subcategory is selling the most.
-- They need the help of an analyst. Please help the company to write a query to show
-- sub category and the Total sales of each sub category. Let your query display only the
-- Subcategory and the Total sales columns to see which product sells the most.

--Solution 1
SELECT [Sub-Category]
	,ROUND(SUM(Sales),1) as Total_Sales
	--,ROUND(Sum(Sales)/(SELECT Sum(Sales)FROM Orders) * 100,2) AS 'Percentage Contribution'
FROM Orders
GROUP BY [Sub-Category]
ORDER BY Total_Sales DESC;

-- Solution 2 Using Subqueries
SELECT [Sub-Category]
	,Round(Total_Sales,2)
FROM (
	SELECT [Sub-Category]
		,Sum(Sales) AS Total_Sales
	FROM Orders
	GROUP BY [Sub-Category]
	) AS subtab1
GROUP BY [Sub-Category], Total_Sales
ORDER BY  Total_Sales DESC;

-- Using a CTE
WITH cte as (SELECT [Sub-Category],
					Sum(Sales) AS Total_Sales					
	FROM Orders
	GROUP BY [Sub-Category])

SELECT [Sub-Category],
		ROUND(Total_Sales,1) as 'Total Sales'
FROM cte
ORDER by Total_Sales DESC;



SELECT
    [Sub-Category],
    ROUND(SUM(Sales) OVER(PARTITION BY [Sub-Category]), 1) as Total_Sales
FROM Orders
GROUP BY [Sub-Category]
ORDER BY Total_Sales DESC;


-- Create a stored procedure
DROP PROCEDURE IF EXISTS CalculateTotalSales
CREATE PROCEDURE CalculateTotalSales
AS
BEGIN
    SELECT
        [Sub-Category],
        ROUND(SUM(Sales), 1) as Total_Sales
    FROM
        Orders
    GROUP BY
        [Sub-Category]
    ORDER BY
        Total_Sales DESC;
END;

-- Create a stored procedure
CREATE PROCEDURE CalculateTotalSales
AS
BEGIN
    SELECT
        [Sub-Category],
        ROUND(SUM(Sales), 1) AS Total_Sales
    FROM
        Orders
    GROUP BY
        [Sub-Category]
    ORDER BY
        Total_Sales DESC;
END;

EXEC CalculateTotalSales;