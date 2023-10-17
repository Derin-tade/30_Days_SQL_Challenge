use MovieSuperstore;
-- 2023/10/17
-- The Briggs Company Has 3 Categories of business generating revenue for the company.
-- They Want to know which of them is driving the business.
-- Write a query to show the total sales and percentages contribution by each category.
-- Show  Category, Total Sales and Percentage Contribution columns in your output.
-- Ordey the percentage contribution in Desc order so we see from highest to lowest

--Solution 1
SELECT Category
	,SUM(Sales) as Total_Sales
	,ROUND(Sum(Sales)/(SELECT Sum(Sales)FROM Orders) * 100,2) AS 'Percentage Contribution'
FROM Orders
GROUP BY Category
ORDER BY [Percentage Contribution];

-- Solution 2 Using Subqueries
SELECT Category
	,Total_Sales
	,ROUND(Total_Sales / (SELECT Sum(Sales)FROM Orders) * 100,2) AS 'Percentage Contribution'
FROM (
	SELECT Category
		,Sum(Sales) AS Total_Sales
	FROM Orders
	GROUP BY Category
	) AS subtab1
GROUP BY Category, Total_Sales
ORDER BY [Percentage Contribution] DESC;

-- Using a CTE
WITH cte as (SELECT Category,
					Sum(Sales) AS Total_Sales					
	FROM Orders
	GROUP BY Category)

SELECT Category,
		ROUND(Total_Sales,0) as 'Total Sales',
		ROUND(Total_Sales/(SELECT SUM(Total_Sales) FROM cte) * 100,2) AS 'Percentage Contribution'
FROM cte
ORDER by [Percentage Contribution] DESC;
