-- Show first 10 customers:
SELECT * FROM customer
LIMIT 10;


-- How many custommers have first name with first letter D?
SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'D%';


-- Which customers spent more than a 100?
SELECT customer_id, SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY total_Spent DESC;


-- What customer  has the lowest cusotmer ID number whose name ends with an 'A' and has an address ID lower than 40?
SELECT first_name, last_name FROM customer
WHERE first_name LIKE '%A'
AND address_id < 40
ORDER BY customer_id;


--Which movie rating are the most common?
SELECT rating, COUNT(*) AS total_movies FROM film
GROUP BY rating
ORDER BY total_movies DESC;

--What is the average payment amount per customer?
SELECT customer_id, AVG(amount) AS avg_payment FROM payment
GROUP BY customer_id
ORDER BY avg_payment DESC;
