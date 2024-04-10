/* Exercise 1: Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID. */
select Name
from STUDENTS
where Marks > '75'
order by right(Name, 3), ID;

/* Exercise 2: Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
Return the result table ordered by user_id.  */
select user_id,
concat (upper(left(name,1)), lower(right(name, length(name)-1))) as name
from Users
order by user_id;

/* Exercise 3: CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.
Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report your results in descending order of total sales. In case of any duplicates, sort them alphabetically by the manufacturer name. Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million".  */
select manufacturer, 
CONCAT( '$', ROUND(SUM(total_sales)/1000000), ' million') AS sales_million
FROM pharmacy_sales 
GROUP BY manufacturer 
ORDER BY SUM(total_sales) DESC, manufacturer;

/* Exercise 4: Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first by month and then by product ID.  */
select
EXTRACT(month from submit_date) as mth,
product_id as product,
round(AVG(stars),2) as avg_stars
from reviews
group by extract(month from submit_date), product_id
order by mth, product;

/* Exercise 5: Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.  */
select sender_id,
count(message_id) as count_messages
from messages
where 
extract (month from sent_date) = '8' and extract (year from sent_date) = '2022'
group by sender_id
order by count_messages DESC
limit 2;


/* Exercise 6: Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
Return the result table in any order. */
select tweet_id 
from Tweets 
where length(content) > 15;


/* Exercise 7: Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.
Return the result table in any order. */
select activity_date as day, 
count(DISTINCT user_id) as active_users
from Activity
where datediff('2019-07-27',activity_date) <30 
and activity_date <= '2019-07-27' 
group by activity_date;


/* Exercise 8: You have been asked to find the number of employees hired between the months of January and July in the year 2022 inclusive.
Your output should contain the number of employees hired in this given time frame. */
select 
count(id) as number_employees
from employees
where extract (month from joining_date) between '1' and '7'
and extract (year from joining_date) = '2020';


/* Exercise 9: Find the position of the lower case letter 'a' in the first name of the worker 'Amitah'. */
select 
position('a' in first_name) as position
from worker
where first_name = 'Amitah';

/* Exercise 10: Find the vintage years of all wines from the country of Macedonia. The year can be found in the 'title' column. Output the wine (i.e., the 'title') along with the year. The year should be a numeric or int data type.  */
select 
substring(title, length(winery) +2, 4)
from winemag_p2
where country ='Macedonian';
