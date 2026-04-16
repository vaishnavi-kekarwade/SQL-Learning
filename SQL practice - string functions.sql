use moviesdb;
# string functions
#upper and lower convert text to uppercase and lowercase
select title , upper(title) as title_upper , lower(industry) # UPPER makes text all caps # lower makes text all small 
from movies;
select title, length(title) from movies; # its like counting letters how many characters are in title
select trim('     hello world    ');

select replace(title,'The' ,'V') from movies; # to fina word and swap it like find and replace the dark world becomes V dark world

select substring(title,1,4) from movies; # column name , from position 1 take 4 characters 

#concat 
select concat(title, "-", industry) from movies; # joins two or more columns together into one

#lets see combined query

select upper (title) as title_upper , length(title) as title_length # calculate
from movies
where length(title)>5 # filter
order by length(title) desc; # sort

