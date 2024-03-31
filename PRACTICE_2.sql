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


/* Exercise 4 */


/* Exercise 5 */


/* Exercise 6 */


/* Exercise 7 */


/* Exercise 8 */


/* Exercise 9 */


/* Exercise 10 */


/* Exercise 11 */


/* Exercise 12 */


