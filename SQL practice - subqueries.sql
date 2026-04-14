#SUBQUERY

#find the movies rating higher than average 
use moviesdb;
SELECT title , imdb_rating
from movies
where imdb_rating > (select avg(imdb_rating) from movies);

#find all actors who worked in movies released after 2009
select name from actors
where actor_id IN( select actor_id from movie_actor
join movies ON movie_actor.movie_id = movies.movie_id
where release_year > 2009);

#add group by with join total revenue per industry
select industry , sum(revenue)as total_revenue
from movies
join financials ON movies.movie_id = financials.movie_id
group by industry;

#movie with highest rating using subquery
# intead of ORDER BY and LIMIT , subquery finds the max value
select title,imdb_rating
from movies
where imdb_rating = (select MAX(imdb_rating) from movies);

# movies that eraned more than average revenue
#subquery inside WHERE , combined with JOIN
SELECT * FROM moviesdb.financials;
select title,revenue
from movies
join financials ON movies_movie_id = financials.movie_id
where revenue > (select avg(revenue) from financials);

# actors whoworkd in more than 1 movie
# subquery returns list, outer subquery check if actor is in
select name from actors
where actor_id IN (
      select actor_id from movie_actor
      group by actor_id
      having count(*) >2
      );
      
# question difference between subquery and join
# answer : join combines two tables together, subquery  , first calculates and uses that result to filter the outer query

#Q when a subquery return one value vs a  list
#answer : one value when using  max-min-avg, used with =or> a list wil return multiple rows , used with IN
# a list is when the subquery returns multiple  rows make list of names used with IN