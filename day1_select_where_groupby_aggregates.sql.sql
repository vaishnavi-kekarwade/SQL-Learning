#starting with the movies database for practice
USE moviesdb;

#fetching only Hollywood movies, learning how WHERE filters rows
SELECT*FROM movies WHERE industry ="Hollywood";

#DISTINCT removes duplicate values, useful to see unique categories
SELECT distinct industry FROM movies;

SELECT * from movies where title LIKE 'THOR%'; #% means "anything after THOR", so this catches Thor, Thor 2, etc.

SELECT * from movies where title LIKE '%America%'; #% on both sides means the word America can appear anywhere in the title

SELECT * from moviesdb.movies; #same as SELECT * FROM movies, just using full database.table format

#a number can't satisfy both conditions at once, always returns 0 rows
SELECT * from movies where imdb_rating>9 and imdb_rating<=8;
SELECT * FROM movies WHERE imdb_rating BETWEEN 8 AND 9;

# OR lets you match multiple values, but IN is cleaner for this
select * from movies where release_year = 2022 or release_year = 2018;

select * 
from movies
where release_year IN (2022,2019,2018); # IN is a shorter way to write multiple OR conditions

SELECT *
FROM movies
WHERE industry ="hollywood"
ORDER BY imdb_rating DESC LIMIT 5 OFFSET 1; #DESC sorts highest first, LIMIT 5 gives top 5, OFFSET 1 skips rank 1


select count(*) from movies where industry ="hollywood";#COUNT counts total rows matching the condition
select MAX(imdb_rating) From movies where industrys ="hollywood";#MAX gives the highest rating among Hollywood movies
select MIN(imdb_rating) From movies where industrys ="hollywood";#MIN gives the lowest rating
select avg(imdb_rating) from movies where studios ="Marvel Studios";# AVG calculates the average, useful for comparing studios

select ROUND(avg(imdb_rating),2) as avg_rating
 from movies where studios="Marvel Studios"; #ROUND(value, 2) limits decimal places, AS gives the column a readable name

 
 select 
  studio , 
  count(*) as cnt,
  avg (imdb_rating) as avg_rating
FROM movies 
where studio!="" #WHERE studio != "" skips rows with no studio name
group by studio #GROUP BY clubs rows by studio so we can aggregate per studio
order by avg_rating desc;

#print all the years where more than 2 movies were released
select release_year,count(*) as movies_count #find all years where more than 2 movies were released
from movies
group by release_year
having movies_count>2 #HAVING filters AFTER grouping (WHERE filters before grouping)
order by movies_count desc; #order of execution: FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY

#from--> where --> group by --> having --> order by

