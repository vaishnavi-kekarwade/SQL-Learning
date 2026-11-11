use world;
# the 5 countries with the largest surface area
select name, surfacearea from country order by surfacearea desc limit 5;

#how many countries are in each continent?
select continent, count(*) as total_countries from country group by continent order by total_countries desc;

# cities with a population over 5 million
select name , countrycode , population from city where population > 5000000 order by Population desc;