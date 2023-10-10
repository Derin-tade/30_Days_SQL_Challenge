use MovieSuperstore
-- day 1 challenge
--Using the Movie Data, write a query to show the titles and movies released in 2017 
-- whose vote count is more than 15 and runtii=me is more than 100
select
	original_title as "Movie Title"
from 
	MovieData
where 
	release_date between '2017-01-01' and '2017-12-31'
	and vote_count > 15
	and runtime>100
