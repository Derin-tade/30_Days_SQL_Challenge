-- what's the total number of customers that have housing, loan and are single

USE MovieSuperstore;

select * from Marketdat4bank;

-- solution 1

select housing, loan, marital, count(*) as Single_House_Loan_Count from Marketdat4bank
where housing = 'yes' and loan = 'yes' and marital = 'single'
group by housing, loan,	marital

select top 1  housing, loan, marital, count(*) over (partition by housing, loan, marital) as Single_House_Loan_Count
from Marketdat4bank
where housing = 'yes' and loan = 'yes' and marital = 'single'


SELECT
    housing,
    loan,
    marital,
    COUNT(*) OVER (PARTITION BY housing, loan, marital) AS Single_House_Loan_Count
FROM
    Marketdat4bank
WHERE
    housing = 'yes' AND loan = 'yes' AND marital = 'single';


if object_id ('singhousloan', 'P') is not null
drop procedure singhousloan

go
create procedure singhousloan
				@marstat varchar(255),
				@houstat varchar(255),
				@loastat varchar(255)
as
		begin	
				select housing, loan, marital, count(*) as Single_House_Loan_Count from Marketdat4bank
					where housing = @houstat and loan = @loastat and marital = @marstat
					group by housing, loan,	marital
		end;
go

exec singhousloan 'single','yes','yes'