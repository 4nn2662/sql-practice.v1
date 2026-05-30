1. Which customers rented the most movies?

SELECT customer.first_name, customer.last_name, COUNT(*) AS total_rents FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
ORDER BY total_rents DESC;

2. Which customers spent the most money?

SELECT customer.first_name, customer.last_name, SUM(amount) AS total_payments FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name 
ORDER BY total_payments DESC;


3. Which customers never rented a movie?

SELECT customer.first_name, customer.last_name FROM customer
LEFT JOIN rental
ON customer.customer_id = rental.customer_id
WHERE rental.rental_id IS NULL;

4. Which movies have never been rented?

SELECT DISTINCT film.title FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
LEFT JOIN rental
ON inventory.inventory_id = rental.inventory_id
WHERE rental.rental_id IS NULL;

5. Which customers never never made a payment?

SELECT customer.customer_id, customer.first_name, customer.last_name FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.payment_id IS NULL;
