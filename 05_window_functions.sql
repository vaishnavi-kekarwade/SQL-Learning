# RANK : rank movies by imdb rating
use moviesdb;
select title ,imdb_rating,
rank() over (order by imdb_rating desc)as ranking 
from movies;

#rank with in each industry separate
select title , industry , imdb_rating,
rank() over(partition by industry order by imdb_rating desc)as industry_rank # partition by is like a group by but it does not collapse into rows, all rows stay visible
from movies;

#row number gives a unique number
select title,imdb_rating,
row_number() over (order by imdb_rating desc) as row_num  # over () is what makes it as window function
from movies;