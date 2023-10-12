use [MovieSuperstore]
-- day 4 challenge
--Using the Movie Data, write a query to show the top 10 movie titles whose language is in english and french and 
-- the budget is more than 1,000,000
select top 10
	original_title as title
from 
	MovieData
where [ budget ] >1000000 
		and 
	original_language = 'en' 
		or 
	original_language = 'fr';

