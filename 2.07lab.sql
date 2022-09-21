use sakila;
-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select c.category_id, count(f.category_id)
from sakila.category c
join sakila.film_category f 
on f.category_id = c.category_id
group by c.category_id;

-- 2 Display the total amount rung up by each staff member in August of 2005.

select s.staff_id, concat(s.first_name, ' ', s.last_name) as employee, sum(p.amount) as `total amount`
from sakila.staff as s
inner join sakila.payment as p on s.staff_id = p.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.staff_id;

-- 3 Which actor has appeared in the most films?

select actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as film_count
from sakila.actor
join sakila.film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;


-- 4 Most active customer (the customer that has rented the most number of films)
select c.customer_id as 'customer_id', c.first_name, c.last_name, count(r.rental_id) as 'number of rentals'
from sakila.customer c
join sakila.rental r using(customer_id)
group by c.customer_id
order by count(r.rental_id) desc;

-- 5 Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from sakila.staff s
join sakila.address a
on a.address_id = s.address_id;

-- 6 List each film and the number of actors who are listed for that film.
select f.title as 'film title', count(fa.actor_id) as 'number of actors'
from sakila.film f
join sakila.film_actor fa using(film_id)
group by f.title
order by count(fa.actor_id) desc;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.first_name, c.last_name, sum(p.amount) as 'total payment'
from sakila.payment p 
join sakila.customer c using(customer_id)
group by c.first_name, c.last_name
order by LAST_NAME asc;
