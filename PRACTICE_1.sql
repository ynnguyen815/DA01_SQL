-- exercise 1
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

-- exercise 2
SELECT * FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- exercise 3
SELECT CITY, STATE FROM STATION
WHERE LAT_N <> 0 AND LONG_W <> 0;

-- exercise 4
SELECT DISTINCT CITY FROM STATION
WHERE (CITY LIKE 'a%' OR CITY LIKE 'e%'  OR CITY LIKE 'i%'  OR CITY LIKE 'o%'  OR CITY LIKE 'u%')
AND (LAT_N <> 0 AND LONG_W <> 0);

-- exercise 5
SELECT DISTINCT CITY FROM STATION
WHERE (CITY LIKE '%a' OR CITY LIKE '%e'  OR CITY LIKE '%i'  OR CITY LIKE '%o'  OR CITY LIKE '%u')
AND (LAT_N <> 0 AND LONG_W <> 0);

-- exercise 6
SELECT DISTINCT CITY FROM STATION
WHERE CITY NOT REGEXP '^[ueoaiUEOAI]'
AND (LAT_N <> 0 AND LONG_W <> 0);

-- exercise 7
SELECT NAME FROM EMPLOYEE
ORDER BY NAME;

-- exercise 8
SELECT NAME FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10;

-- exercise 9
SELECT product_id from Products
where low_fats ='Y' and recyclable ='Y';

-- exercise 10
select name from Customer
where (referee_id <> '2') or (referee_id is null);

-- exercise 11
select name, population, area from World
where (area >= '3000000') or (population >= '25000000'); 

-- exercise 12
select distinct author_id as id from Views
where author_id = viewer_id
order by id;

-- exercise 13
SELECT part, assembly_step  FROM parts_assembly
WHERE finish_date is NULL;

-- exercise 14
select * from lyft_drivers 
where yearly_salary <= '30000' or yearly_salary >= '70000';

-- exercise 15
select advertising_channel from uber_advertising
where money_spent > '100000';



