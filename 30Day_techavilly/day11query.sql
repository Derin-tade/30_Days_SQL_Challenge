-- 2023-10-23
-- Your company stared consulting for Micro Bank who needs 
-- This will help them plan their next marketing campaign. You are the analyst on board for this job.
-- They need data to back up their offer for divorced customers.
-- Using the marketing data, write a query to show the percentage of customers who are divorced,
-- and have balances greater than 2000.

-- Drop the procedure if it exists
USE MovieSuperstore;
SELECT * from Marketdat4bank;

SELECT
    COUNT(CASE WHEN marital = 'divorced' AND Balance > 2000 THEN 1 END) AS Divorced_Customers_Over_2000,
    COUNT(*) AS Total_Customers,
    (COUNT(CASE WHEN marital = 'divorced' AND Balance > 2000 THEN 1 END) * 100.0) / COUNT(*) AS Percentage
FROM Marketdat4bank;


-- Subquery

SELECT 
	FORMAT(ROUND(divorced_over_2k*100.0/total_counts,2),'0.###') AS '%Divorced Customers Over 2,000'
FROM (SELECT 
			COUNT(*) AS total_counts,
			COUNT(CASE WHEN marital like '%vorce%' and balance>2000 THEN 1 END) AS divorced_over_2k
		FROM Marketdat4bank) AS subtab1


--CTE
WITH cte_divorced_over2k
AS (
	SELECT COUNT(CASE 
				WHEN marital = 'divorced'
					AND balance > 2000
					THEN 1
				END) AS divorced_customers_over_2k,
		COUNT(*) AS total_count
	FROM Marketdat4bank
	)
SELECT FORMAT(ROUND((divorced_customers_over_2k * 100.0 / total_count), 2), '0.###') 
		AS '%Divorced Customers Over 2,000'
FROM cte_divorced_over2k;

-- Stored Procedure

IF OBJECT_ID('married_over_balance','P') IS NOT NULL
	DROP PROCEDURE married_over_balance;

GO

CREATE PROCEDURE married_over_balance
	@marstat VARCHAR(255),
	@crntbal FLOAT
AS 
BEGIN
	SELECT FORMAT(ROUND([%Divorced Customers Over 2,000],2),'0.###') AS 'Divorced Customers Over 2,000'
	FROM (SELECT
			COUNT(*) AS total_counts,
			COUNT(CASE WHEN marital = @marstat and balance>@crntbal THEN 1 END) AS divorced_over_2k,
			(COUNT(CASE WHEN marital = @marstat and balance>@crntbal THEN 1 END)*100.0/count(*)) AS '%Divorced Customers Over 2,000'
	FROM Marketdat4bank) AS subtab1
END;
GO

EXEC married_over_balance 'divorced',2000;

-- 

-- FROM Marketdat4bank;





-- testing
select * from Marketdat4bank
where marital like '%ivor%'