use techavilly;
SELECT 
    first_name,
    last_name,
    salary,
    CAST(AVG(salary) OVER () AS SIGNED)AS Company_Average,
    CAST(salary AS SIGNED) -  CAST(AVG(salary) OVER () AS SIGNED) AS salary_diff
FROM
    employeetable;

