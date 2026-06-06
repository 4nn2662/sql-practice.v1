-- Classify customers based on their total spending.
SELECT
customer.customer_id, 
customer.first_name, 
customer.last_name,
SUM(payment.amount) AS total_spent,
CASE
	WHEN SUM(payment.amount) >= 150 THEN 'High Value'
	WHEN SUM(payment.amount) >= 100 THEN 'Medium Value'
	ELSE 'Low Value'
END AS customer_segment
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY
customer.customer_id, 
customer.first_name,
customer.last_name
ORDER BY total_spent DESC;

-- Classify movies based on their duration
SELECT title, length,
CASE
	WHEN length < 60 THEN 'Short'
	WHEN length BETWEEN 60 AND 90 THEN 'Medium'
    ELSE 'Long'
END AS movie_length
FROM film;

-- Classify customers based on their number of rentals

SELECT
customer.customer_id, 
customer.first_name, 
customer.last_name,
SUM(rental.rental_id) AS total_rentals,
CASE
	WHEN COUNT(rental.rental_id) >= 40 THEN 'Frequent Customer'
	WHEN COUNT(rental.rental_id) >= 20 THEN 'Regular Customer'
	ELSE 'Occasional Customer'
END AS customer_type
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
GROUP BY
customer.customer_id, 
customer.first_name,
customer.last_name
ORDER BY total_rentals DESC;
