
USE MovieSuperstore;

SELECT * FROM Orders;
SELECT Segment, 
	SUM(sales) AS Total_Sales, 
	SUM(Profit) AS Total_Profit, 
	ROUND(SUM(Profit)/SUM(Sales),4) *100 as Profit_Margin
FROM Orders
GROUP BY Segment
ORDER BY Profit_Margin DESC

DROP TABLE IF EXISTS ProfitMarginTab1;
SELECT Segment, 
	SUM(Sales) AS Total_Sales, 
	SUM(Profit) AS Total_Profit, 
	SUM(Profit) / SUM(Sales) * 100 AS Profit_Margin
INTO ProfitMarginTab1
FROM Orders
GROUP BY Segment;

SELECT 
	Segment,
	ROUND(Total_Sales,2) AS Total_Sales,
	ROUND(Total_Profit,2) AS Total_Profit,
	ROUND(Profit_Margin,2) AS Profit_Margin
FROM ProfitMarginTab1
ORDER BY Profit_Margin DESC;