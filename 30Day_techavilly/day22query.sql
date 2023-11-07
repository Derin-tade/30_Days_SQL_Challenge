SELECT
	first_name, last_name, department, salary, department_salary_rank
FROM
    (SELECT *, rank() OVER w AS department_salary_rank
	FROM
		employeetable window w AS ( PARTITION BY department ORDER BY salary DESC ) ) AS subq;