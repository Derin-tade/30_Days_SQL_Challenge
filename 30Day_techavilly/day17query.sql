USE techavilly;
SELECT 
    *
FROM
    shareprice;

SELECT 
    ROUND(MIN(_close - _open),2) AS highest_daily_decrease,
    ROUND(MAX(_close - _open),2) AS highest_daily_increase
FROM
    shareprice;