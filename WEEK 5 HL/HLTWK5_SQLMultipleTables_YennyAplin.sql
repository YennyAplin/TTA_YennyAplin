
-- Home Learning Task (HLT WEEK 5: Second Task: SQL Querying Multiple Tables)

-- Using the Sakila database, complete the following tasks:

use sakila;

-- 1) Fill in the blanks (denoted by <#>) for the following query to obtain the results that follow:

select c.first_name, c.last_name, a.address, ct.city
from customer c
	inner join address a
    on c.address_id = a.address_id
    inner join city ct
    on a.city_id = ct.city_id
where a.district = 'California';

-- The answer for <1>: a
-- The answer for <2>: ct.city_id


-- 2) Write a query that returns the title of every film in which an actor with the first name JOHN appeared.

select f.title
from film as f
	inner join film_actor as fa
	on f.film_id = fa.film_id
	inner join actor as a
	on fa.actor_id = a.actor_id
where a.first_name = 'JOHN';


-- 3) Construct a query that finds returns all addresses which are in the same city. 
-- You will need to join the address table to itself, and each row should include 2 different addresses.

Select a.city_id, a.address, a1.address 
from address a
    inner join address a1
    on a.city_id = a1.city_id 
where a.address < a1.address;
    