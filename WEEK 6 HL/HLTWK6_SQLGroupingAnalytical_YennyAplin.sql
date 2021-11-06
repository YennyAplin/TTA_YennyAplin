
-- Home Learning Task (HLT WEEK 6 - First Task: SQL Grouping, Aggragates and Analytical Functions)

-- Using the Sakila database, complete the following tasks:

use sakila;

-- 1) Construct a query that counts the number of rows in the payment table:
Select count(*) from payment;

-- 2) Modify your query from question 1 to count the number of payments made by each customer.
-- Show the customer ID and the total amount paid for each customer.
Select customer_id, count(*), sum(amount)
from payment
group by customer_id;

-- 3) Modify your query from Exercise 2 to include only those customers having made at least five payments.

Select customer_id, count(*), sum(amount)
from payment
group by customer_id
having count(*) >= 5;


-- ------------------------------------------------------------------------------------------
-- Create a FilmSales database, and Sales_Fact table to complete the next following tasks:

DROP DATABASE IF EXISTS FilmSales;
CREATE DATABASE FilmSales;	

use FilmSales;

DROP TABLE IF EXISTS Sales_Fact;
CREATE TABLE Sales_Fact(
year_no SMALLINT UNSIGNED NOT NULL,
month_no TINYINT UNSIGNED NOT NULL,
tot_sales INT UNSIGNED NOT NULL
);

INSERT INTO Sales_Fact VALUES (2019,1, 19228), 
(2019, 2, 18554),
(2019, 3, 17325),
(2019, 4, 13221),
(2019, 5, 9964),
(2019, 6, 12658),
(2019, 7, 14233),
(2019, 8, 17342),
(2019, 9, 16853),
(2019, 10, 17121),
(2019, 11, 19095),
(2019, 12, 21436),
(2020, 1, 20347),
(2020, 2, 17434),
(2020, 3, 16225),
(2020, 4, 13853),
(2020, 5, 14589),
(2020, 6, 13248),
(2020, 7, 8728),
(2020, 8, 9378), 
(2020, 9, 11467),
(2020, 10, 13842),
(2020, 11, 15742),
(2020, 12, 18636); 

Select * from Sales_Fact;

-- 4) Write a query that retrieves every row from Sales_Fact, and add a column to generate a
-- ranking based on the tot_sales column values. The highest value should receive a
-- ranking of 1, and the lowest a ranking of 24.

Select year_no, month_no, tot_sales,
	rank() over (order by tot_sales desc) TotSales_Rank
from Sales_fact;


-- 5) Modify the query from exercise 4 to generate two sets of rankings from 1 to 12, 
-- one for 2019 data and one for 2020.

Select year_no, month_no, tot_sales,
	rank() over (partition by year_no order by tot_sales desc) TotSales_Rank
from Sales_fact;

-- 6) Write a query that retrieves all 2020 data, and include a column which will contain the
-- tot_sales value from the previous month.

Select year_no, month_no, tot_sales,
	lag(tot_sales) over (order by month_no) prev_mth_TotSales
from Sales_fact
where year_no = 2020;
