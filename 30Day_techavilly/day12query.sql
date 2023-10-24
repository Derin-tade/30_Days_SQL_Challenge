USE MovieSuperstore;


select 
	job, 
	count(*) as Frequency 
from 
	Marketdat4bank 
group by job 
order by Frequency desc;

SELECT DISTINCT
    job,
    COUNT(*) OVER (PARTITION BY job) AS Frequency
FROM Marketdat4bank
ORDER BY Frequency DESC;

--
WITH cte
AS (
	SELECT DISTINCT job,
		COUNT(*) OVER (PARTITION BY job) AS Frequency
	FROM Marketdat4bank
	)
SELECT job,
	Frequency
FROM cte
ORDER BY Frequency DESC;



select * from Marketdat4bank