-- Home Learning Task (HLT WEEK 5: First Task: SQL Filtering)

-- Using the Sakila database, complete the following tasks:

use sakila;

-- 1) Which of the payment IDs would be returned by the following filter conditions? customer_id <> 5 AND (amount > 8 OR payment_date ) = '2005 08 23’)

select p.payment_id from payment as p
where p.customer_id <> 5 and (p.amount > 8 or date(p.payment_date) = '2005-08-23');

-- 2) Which of the payment IDs would be returned by the following filter conditions? customer_id = 5 AND NOT (amount > 6 OR payment_date ) = '2005 06 19’)

select p.payment_id from payment as p
where p.customer_id = 5 and not (p.amount > 6 or date(p.payment_date) = '2005-06-19');

-- 3) Construct a query that retrieves all rows from the Payment table where the amount is either 1.98, 7.98, or 9.98.

select * from payment as p
where p.amount = 1.98 or p.amount = 7.98 or p.amount = 9.98;

select * from payment as p
where p.amount in (1.98, 7.98, 9.98);

-- 4) Construct a query that finds all customers whose last name contains an A in the second position and a W anywhere after the A.

select * from customer as c
where last_name like '_A%W%';
