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