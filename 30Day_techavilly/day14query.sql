use MovieSuperstore;

select * from Marketdat4bank;


-- cte
WITH cte
AS (
	SELECT job,
		AVG(duration) AS avg_weeks
	FROM Marketdat4bank
	GROUP BY job
	)
SELECT ROUND(avg_weeks / 52, 2) AS 'Average years in management roles'
FROM cte
WHERE job = 'management'
ORDER BY avg_weeks;

-- cte 2
WITH cte
AS (
	SELECT DISTINCT job,
		AVG(duration) OVER(PARTITION BY job) AS avg_weeks 
	FROM Marketdat4bank)
SELECT ROUND(avg_weeks / 52, 2) AS 'Average years in management roles'
FROM cte
WHERE job = 'management'
ORDER BY avg_weeks;

-- subquery1
SELECT ROUND(avg_weeks / 52, 2) AS 'Average years in management roles'
FROM (
	SELECT DISTINCT job,
		AVG(duration) OVER (PARTITION BY job) AS avg_weeks
	FROM Marketdat4bank
	) subq1
WHERE job = 'management'
ORDER BY avg_weeks;

-- Stored Procedure
IF OBJECT_ID('avg_years_in_specific_role', 'P') IS NOT NULL
	DROP PROCEDURE avg_years_in_specific_role
GO

CREATE PROCEDURE avg_years_in_specific_role @positiontype VARCHAR(255)
AS
BEGIN
	SELECT ROUND(avg_weeks / 52, 2) AS 'Average years in management roles'
	FROM (
		SELECT DISTINCT job,
			AVG(duration) OVER (PARTITION BY job) AS avg_weeks
		FROM Marketdat4bank
		) subq1
	WHERE job = @positiontype
END;
GO

EXEC avg_years_in_specific_role 'management'

-- Stored Procedure
IF OBJECT_ID('avg_years_in_specific_role', 'P') IS NOT NULL
	DROP PROCEDURE avg_years_in_specific_role
GO

CREATE PROCEDURE avg_years_in_specific_role 
				@positiontype VARCHAR(255)
AS
	BEGIN
			WITH cte
					AS (
						SELECT DISTINCT job,
							AVG(duration) OVER(PARTITION BY job) AS avg_weeks 
						FROM Marketdat4bank)
			SELECT ROUND(avg_weeks / 52, 2) AS 'Average years in management roles'
			FROM cte
			WHERE job = @positiontype
	END;
GO

EXEC avg_years_in_specific_role 'management'
	

 


