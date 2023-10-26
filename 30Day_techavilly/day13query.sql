use MovieSuperstore;

select * from Marketdat4bank

SELECT TOP 1
	job,
    education,
    COUNT(*) AS Frequency
FROM
    Marketdat4bank
WHERE
    job = 'management'
GROUP BY
    job, education
ORDER BY
    Frequency DESC;