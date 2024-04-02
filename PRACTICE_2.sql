/* Exercise 1: Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.  */
SELECT DISTINCT CITY FROM STATION
WHERE ID % 2 = 0;

/* Exercise 2: Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.  */
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS DIFFERENCE
FROM STATION;

/* Exercise 3 : Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: ACTUAL - MISCALCULATED  average monthly salaries), and round it up to the next integer.*/
SELECT ROUND(AVG(Salary)) - ROUND(AVG(REPLACE(Salary, "0", "")))
FROM EMPLOYEES;


/* Exercise 4:You're trying to find the mean number of items per order on Alibaba, rounded to 1 decimal place using tables which includes information on the count of items in each order (item_count table) and the corresponding number of orders for each item count (order_occurrences table). NEED TO CHANGE INTEGER TO DECIMAL. Using ::DECIMAL or CAST(field AS decimal */
SELECT 
ROUND(SUM(item_count::DECIMAL * order_occurrences) / SUM(order_occurrences), 1) AS MEAN
FROM items_per_order;

/* Exercise 5: Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order. */
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;


/* Exercise 6: Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post. */
SELECT user_id,
MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021
GROUP BY user_id
HAVING COUNT (post_id) > 1;

/* Exercise 7: Your team at JPMorgan Chase is preparing to launch a new credit card, and to gain some insights, you're analyzing how many credit cards were issued each month.
Write a query that outputs the name of each credit card and the difference in the number of issued cards between the month with the highest issuance cards and the lowest issuance. Arrange the results based on the largest disparity. */
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

/* Exercise 8: CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. Each drug is exclusively manufactured by a single manufacturer.
Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.
Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. Display the results sorted in descending order with the highest losses displayed at the top. */
SELECT manufacturer, 
COUNT(drug) AS drug_count,
ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC;

/* Exercise 9: Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.  */
SELECT id, movie, description, rating FROM Cinema
WHERE (id % 2 <> 0)  AND (description <> 'boring')
ORDER BY rating DESC;

/* Exercise 10: Write a solution to calculate the number of unique subjects each teacher teaches in the university.
Return the result table in any order.  */
SELECT teacher_id,
COUNT( DISTINCT subject_id) AS cnt FROM Teacher
GROUP BY teacher_id;

/* Exercise 11: Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.*/
SELECT  user_id,
COUNT(user_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

/* Exercise 12: Write a solution to find all the classes that have at least five students.
Return the result table in any order.  */
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5;

