USE techavilly;

SELECT *
FROM employeetable
-- where salary = max(salary)
ORDER BY salary;


WITH cte
AS (
	SELECT *
	FROM employeetable
	ORDER BY salary DESC LIMIT 1
	)
SELECT job_title,
	department
FROM cte;

-- 

SELECT
    job_title,
    department
FROM
    (
        SELECT
            *,
            row_number() OVER w AS row_num
        FROM
            employeetable window w AS ( ORDER BY salary DESC ) ) AS subq
WHERE
    row_num = 1;

