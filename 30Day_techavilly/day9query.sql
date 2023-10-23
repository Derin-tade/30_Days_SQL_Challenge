USE MovieSuperstore;
-- 2023-10-19
-- Now that you've identified phones as the business driver in terms of revenue,
-- the company wants to know the total "phone sales" by year to understand how "each year" performed.
-- As the analyst, please help them to show the breakdown of the total sales by year in descending order.
-- Let your output show only Total sales and Sales year column


-- Solution 1
SELECT 
	ROUND(SUM(sales),1) AS Total_Sales, 
	YEAR([Order Date]) AS Sales_Year 
FROM Orders 
WHERE [Sub-Category] = 'Phones'
GROUP BY YEAR([Order Date])
ORDER BY Total_Sales DESC;

--Subquery 1
SELECT 
	ROUND(Total_Sales,1) AS Total_Sales, 
	Sales_Year 
FROM 
	(SELECT 
			SUM(sales) AS Total_Sales, 
			YEAR([Order Date]) AS Sales_Year 
	FROM Orders 
	WHERE [Sub-Category] = 'Phones'
	GROUP BY YEAR([Order Date])
	) AS subtab1
ORDER BY Total_Sales DESC;

-- Subquery 2
SELECT
    SUM(Total_Sales) AS Total_Sales,
	Sales_Year
FROM (
    SELECT
        ROUND(SUM(Sales), 1) AS Total_Sales,
        YEAR([Order Date]) AS Sales_Year
    FROM Orders
	WHERE [Sub-Category] = 'Phones'
    GROUP BY YEAR([Order Date])
) AS subquery
GROUP BY Sales_Year
ORDER BY Total_Sales DESC;

-- Using CTE
WITH cte as 
			(SELECT 
					SUM(sales) AS Total_Sales, 
					YEAR([Order Date]) AS Sales_Year,
					[Sub-Category]
			FROM Orders 
			GROUP BY YEAR([Order Date]),  [Sub-Category])

SELECT 
	ROUND(Total_Sales,1) AS Total_Sales, 
	Sales_Year 
FROM cte 
WHERE [Sub-Category] = 'Phones'
ORDER BY Total_Sales DESC
	
-- Using a Standard Procedure
/* 
drop procedure if exists subcat_sales_year;

delimiter $$
create procedure subcat_sales_year(in subcat varchar)
begin
SELECT 
	ROUND(SUM(sales),1) AS Total_Sales, 
	YEAR([Order Date]) AS Sales_Year 
FROM Orders 
WHERE [Sub-Category] = subcat
GROUP BY YEAR([Order Date])
ORDER BY Sales_Year DESC$$
end$$

*/

-- 2023-10-19
-- Now that you've identified phones as the business driver in terms of revenue,
-- the company wants to know the total "phone sales" by year to understand how "each year" performed.
-- As the analyst, please help them to show the breakdown of the total sales by year in descending order.
-- Let your output show only Total sales and Sales year column

-- Drop the procedure if it exists
IF OBJECT_ID('subcat_sales_year', 'P') IS NOT NULL
    DROP PROCEDURE subcat_sales_year;
GO

-- Create the procedure
CREATE PROCEDURE subcat_sales_year
    @subcat VARCHAR(255) -- Parameter for the Sub-Category
AS
BEGIN
    SELECT 
        ROUND(SUM(sales), 1) AS Total_Sales, 
        YEAR([Order Date]) AS Sales_Year 
    FROM Orders 
    WHERE [Sub-Category] = @subcat -- Use the parameter for filtering
    GROUP BY YEAR([Order Date])
    ORDER BY Total_Sales DESC;
END;
GO

EXEC subcat_sales_year 'Phones';

