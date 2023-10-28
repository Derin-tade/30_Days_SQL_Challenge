use MovieSuperstore;




select title, runtime 
from MovieData
where runtime >= 250
order by runtime desc;