select email,customer.customer_id from customer
INNER JOIN country
ON customer.customer_id=country.country_id
WHERE country ILIKE 'California'



SELECT * FROM actor
WHERE first_name = 'Nick'

select title,film_id from film
INNER JOIN actor
ON film.film_id=actor.actor_id
WHERE actor_id = 2
