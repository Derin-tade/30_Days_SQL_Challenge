-- what's the total number of customers that have housing, loan and are single
USE MovieSuperstore;

SELECT *
FROM Marketdat4bank;

-- solution 1
SELECT housing,
	loan,
	marital,
	COUNT(*) AS Single_House_Loan_Count
FROM Marketdat4bank
WHERE housing = 'yes'
	AND loan = 'yes'
	AND marital = 'single'
GROUP BY housing,
	loan,
	marital

SELECT TOP 1 housing,
	loan,
	marital,
	COUNT(*) OVER (
		PARTITION BY housing,
		loan,
		marital
		) AS Single_House_Loan_Count
FROM Marketdat4bank
WHERE housing = 'yes'
	AND loan = 'yes'
	AND marital = 'single'

SELECT housing,
	loan,
	marital,
	COUNT(*) OVER (
		PARTITION BY housing,
		loan,
		marital
		) AS Single_House_Loan_Count
FROM Marketdat4bank
WHERE housing = 'yes'
	AND loan = 'yes'
	AND marital = 'single';

IF OBJECT_ID('singhousloan', 'P') IS NOT NULL
	DROP PROCEDURE singhousloan
GO

CREATE PROCEDURE singhousloan 
	@marstat VARCHAR(255),
	@houstat VARCHAR(255),
	@loastat VARCHAR(255)
AS
BEGIN
	SELECT housing,
		loan,
		marital,
		count(*) AS Single_House_Loan_Count
	FROM Marketdat4bank
	WHERE housing = @houstat
		AND loan = @loastat
		AND marital = @marstat
	GROUP BY housing,
		loan,
		marital
END;
GO

EXEC singhousloan 'single','yes','yes'
