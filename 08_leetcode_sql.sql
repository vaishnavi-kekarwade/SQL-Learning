-- LeetCode SQL: Combine Two Tables 'Easy'
-- Idea: LEFT JOIN so people without an address still appear.
-- Learned: LEFT JOIN keeps every row from the left table.

# Write your MySQL query statement below
SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;

-- LeetCode SQL: Duplicate Emails 'Easy'
-- Idea: write in your own words how you found emails that appear more than once
-- Learned: what GROUP BY and HAVING each do
#Important concept:
#WHERE filters individual rows before grouping.
#HAVING filters groups after grouping
#Task: Find all email addresses that appear more than once.

# Write your MySQL query statement below
select email
from person
group by email
having count(email)>1;