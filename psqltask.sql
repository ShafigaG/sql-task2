--Find unique customer names who did not purchase any product 
--which has already been bought by 'Ayxan'

SELECT DISTINCT customer_name FROM orders 
WHERE customer_name NOT IN (SELECT customer_name FROM orders
							WHERE product_name IN (SELECT product_name FROM orders
												   WHERE customer_name = 'Ayxan')
);