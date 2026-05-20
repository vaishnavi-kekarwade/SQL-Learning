# CURDATE() gives todays date YEAR() extracts just the year from it
#calculating age of each actor using current year minus birth year
select *,year(CURDATE())-birth_year as age FROM actors;

#calculating profit by subtracting budget from revenue
#creating a new column called profit using arithmetic in SELECT
use moviesdb;
select *, (revenue-budget) as profit from moviesdb.financials;

#IF function is - if currency is USD convert revenue, else keep as is
SELECT * FROM moviesdb.financials;
select *,(revenue-budget) as profit from moviesdb.financials;
select * ,
IF(currency = 'USD', revenue*77, revenue) as revenue_inr
from moviesdb.financials;

select distinct unit  from financials; # to know units 

#INNER JOIN is combining movies and financials table using common column movie_id
SELECT movies.movie_id, title, budget, revenue, currency, unit
FROM movies
JOIN financials
ON movies.movie_id = financials.movie_id;

#extra for practice#
#LEFT JOIN is all movies even if no financial data exists
SELECT movies.movie_id, title, budget, revenue
FROM movies
LEFT JOIN financials
ON movies.movie_id = financials.movie_id;

#spot the difference: run INNER JOIN and LEFT JOIN one by one
#notice LEFT JOIN shows more rows where budget/revenue is NULL
#IF with two columns as label movies as profit or loss
SELECT title, revenue, budget,
IF(revenue > budget, 'Profit', 'Loss') AS verdict
FROM movies
JOIN financials
ON movies.movie_id = financials.movie_id;

#CASE WHEN is same idea as IF but for multiple conditions
SELECT title, imdb_rating,
CASE
    WHEN imdb_rating >= 8 THEN 'Superhit'
    WHEN imdb_rating >= 6 THEN 'Average'
    ELSE 'Flop'
END AS movie_verdict
FROM movies;
