
-- Home Learning Task (HLT WEEK 4: Third Task: SQL Data Generation, Manipulation and Conversion)

-- Using the Sakila Schema, complete the following tasks:

use sakila;

-- 1) Write a query that returns the 17 through 25 characters of the string 'Please find the substring in this string’.

Select substring('Please find the substring in this string', 17, 9);

-- 2) Write a query that returns the absolute value and sign (−1, 0, or 1) of the number −25.76823. 
-- Also return the number rounded to the nearest hundredth.

Select abs(-25.76823), sign(-25.76823), round(-25.76823, 2);

-- 3) Write a query to return just the month portion of the current date.

Select extract(month from current_date());
