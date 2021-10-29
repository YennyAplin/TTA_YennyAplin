
-- Home Learning Task (HLT WEEK 4: Second Task: SQL Queries)

-- Using the Sakila Schema, complete the following tasks:

use sakila;

-- 1) Retrieve the actor ID, first name, and last name for all actors. Sort by last name and then by first name.

select a.actor_id, a.last_name, a.first_name from actor as a
order by a.last_name, a.first_name;

-- 2) Retrieve the actor ID, first name, and last name for all actors whose last name equals 'WILLIAMS' or 'DAVIS’

select a.actor_id, a.first_name, a.last_name from actor as a
where a.last_name = 'WILLIAMS' or a.last_name ='DAVIS';

-- 3) Write a query against the rental table that returns the IDs of the customers who rented a film on July 5th 2005 (use the rental.rental_date column,
-- and you can use the date() function to ignore the time component). Include a single row for each distinct customer ID.

select r.rental_id from rental as r
where date (r.rental_date) = '2005-07-05';

-- 4) 4. Fill in the blanks (denoted by <#>) for this multi-table query to achieve the results shown below.

select c.email, r.return_date
from customer c
	inner join rental r
    on c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14'
order by 2 desc;

-- The answer for <1>: r
-- The answer for <2>: r.customer_id
-- The answer for <3>: 2
-- The answer for <4>: desc
