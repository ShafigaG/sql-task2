-- 1. count all orders
SELECT COUNT(*) FROM orders

-- 2. count orders per customer
SELECT customer_name, COUNT(*) FROM orders
GROUP BY customer_name;

-- 3. total amount per customer
SELECT customer_name, SUM(amount) FROM orders
GROUP BY customer_name;

-- 4. average amount per customer
SELECT customer_name, AVG(amount) FROM orders
GROUP BY customer_name;

-- 5. customer with highest total
SELECT customer_name, SUM(amount) FROM orders
GROUP BY customer_name
ORDER BY SUM(amount) DESC LIMIT 1;

-- 6. total count of each product sold
SELECT COUNT(DISTINCT product) FROM orders;

-- 7. total revenue by product
SELECT product, SUM(amount) FROM orders
GROUP BY product;

-- 8. top 2 customers by total amount
SELECT customer_name, SUM(amount) FROM orders
GROUP BY customer_name
ORDER BY SUM(amount) DESC LIMIT 2;

-- 9. customers with more than 1 order
SELECT customer_name FROM orders
GROUP BY customer_name
HAVING COUNT(product) > 1;

-- 10. products bought more than once 
SELECT product FROM orders
GROUP BY product 
HAVING COUNT(customer_name) > 1;

-- 11. product vs total amount spent
SELECT product, SUM(amount) FROM orders
GROUP BY product;

-- 12. customer vs most expensive product
SELECT o.customer_name, o.product, o.amount FROM orders o
JOIN (SELECT customer_name, MAX(amount) AS max_amount FROM orders
		GROUP BY customer_name) as max_order
ON o.customer_name = max_order.customer_name
AND o.amount = max_order.max_amount;

-- 13. count customers who bought 'Laptop'
SELECT COUNT(DISTINCT customer_name) FROM orders
WHERE product = 'Laptop';

-- 14. average amount spent per product
SELECT product, AVG(amount) FROM orders
GROUP BY product;

-- 15. product with highest total revenue
SELECT product, SUM(amount) FROM orders
GROUP BY product 
ORDER BY SUM(amount) DESC LIMIT 1;

-- 16. list products and total amounts sorted descending
SELECT product, SUM(amount) FROM orders
GROUP BY product 
ORDER BY SUM(amount) DESC;

-- 17. customers who spent > 1000 in total
SELECT customer_name FROM orders
GROUP BY customer_name
HAVING SUM(amount) > 1000;

-- 18. group by first letter of customer names
SELECT LEFT(customer_name, 1), SUM(amount) FROM orders
GROUP BY LEFT(customer_name, 1);

-- 19. list products not yet purchased
CREATE TABLE products (
	name VARCHAR(100)
)

INSERT INTO products (name) VALUES
('Laptop'), ('Mouse'), ('Keyboard'), ('Monitor'),
('Phone'), ('Game Console'), ('Headphones');

SELECT p.name FROM products p
LEFT JOIN orders o ON p.name = o.product
WHERE o.product IS NULL;

-- 20. group by customer + product
SELECT customer_name, product FROM orders
GROUP BY customer_name, product;

-- 21. find all orders where customer name starts with 'A'
SELECT * FROM orders
WHERE customer_name LIKE 'A%';

-- 22. find all products containing 
--the word 'top' (case-insensitive)
SELECT * FROM orders
WHERE product ILIKE '%top%';

-- 23. count how many times customers
--with names ending in 'r' made purchases
SELECT COUNT(*) FROM orders
WHERE customer_name LIKE '%r';

-- 24. list all products that have exactly 5 letter
SELECT product FROM orders
WHERE LENGTH(product) = 5;

-- 25. count orders where customer name 
--contains 'li' (case-insensitive)
SELECT * FROM orders
WHERE customer_name ILIKE '%li%';