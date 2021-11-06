
-- Home Learning Task (HLT WEEK 6 - Second Task: Importing, exporting and SQL Views)

-- Using the Sakila database, complete the following tasks:

use sakila;

-- 1) Create a view definition that can be used by the following query to generate the given results:

Select title, category_name, first_name, last_name
from film_ctgry_actor
where last_name = 'FAWCETT'; 


Create view film_ctgry_actor
as
Select f.title, c.name category_name, a.first_name, a.last_name
  from film f
  inner join film_category fcat
  on f.film_id = fcat.film_id
  inner join category c
  on fcat.category_id = c.category_id
  inner join film_actor fa
  on f.film_id = fa.film_id
  inner join actor a
  on fa.actor_id = a.actor_id;
  
  
  -- 2) The film rental company manager would like to have a report that includes the name of every country,
  -- along with the total payments for all customers who live in each country.
 --  Generate a view definition that queries the country table and uses a scalar subquery to
 --  calculate a value for a column named tot_payments
 
 
Create view CountryPayments
as
Select c.country,
 (Select sum(p.amount)
  from city ci
    inner join address a
    on ci.city_id = a.city_id
    inner join customer cu
    on a.address_id = cu.address_id
    inner join payment p
    on cu.customer_id = p.customer_id
  where ci.country_id = c.country_id
 ) Total_Payments
from country c;

select * from CountryPayments;

