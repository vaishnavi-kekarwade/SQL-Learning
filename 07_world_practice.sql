use world;
# the most populatd cities\
select Name, Countrycode, population from city order by population desc limit 5;

#how many cities does each country have? top 5
select CountryCode , count(*) as total_cities from city group by CountryCode order by total_cities desc limit 5;

#average life expectancy for each continent
select continent , avg(lifeExpectancy)as avg_life from country group by Continent order by avg_life desc;
