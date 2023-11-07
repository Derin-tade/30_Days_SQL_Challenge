use techavilly;
select * from employeetable;

select  count(job_title) as AnalystToTotalRatio,  AnalystCount from( select  count(job_title) as AnalystCount from employeetable where job_title='Analyst') as subq;

SELECT (
		SELECT count(job_title)
		FROM employeetable
		WHERE job_title = 'Analyst'
		) AS AnalystCount
	,count(job_title) AS AnalystToTotalRatio
FROM employeetable;
-- 
With CTE as(	SELECT (
			SELECT count(job_title)
			FROM employeetable
			WHERE job_title = 'Analyst'
			) AS AnalystCount
		,count(job_title) AS Total_Count
	FROM employeetable)
SELECT 
	AnalystCount,
    CAST((AnalystCount / Total_Count)* 100 AS SIGNED)  AS AnalystRatio
FROM
    cte;


