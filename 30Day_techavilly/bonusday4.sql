use MovieSuperstore;

SELECT TOP 1 sales
FROM (
    SELECT TOP 3 sales
    FROM Orders
    ORDER BY sales DESC
) AS SubQuery
ORDER BY sales ASC;


with cte as (select  sales, ROW_NUMBER() over (order by sales desc) as sales_rank
from orders)
select sales from cte where sales_rank =3



