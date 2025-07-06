--1. Hər istifadəçinin verdiyi ümumi sifariş sayını tap.
SELECT u.name, COUNT(o.id) FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.name;

-- 2. Hər istifadəçinin ümumi xərclədiyi məbləği 
--(məhsul qiyməti * say) hesablamaq.
SELECT u.name, SUM(p.price * o.quantity) FROM users u
JOIN orders o ON u.id = o.user_id
JOIN product p ON o.product_id = p.id
GROUP BY u.name;

-- 3. Hər bir şəhər üzrə ortalama sifariş xərclərini hesablamaq.
SELECT u.city, AVG(p.price * o.quantity) FROM orders o
JOIN users u ON o.user_id = u.id
JOIN product p ON o.product_id = p.id
GROUP BY u.city;

-- 4. Ən çox pul xərcləyən istifadəçini tap.
SELECT u.name, SUM(p.price * o.quantity) FROM users u
JOIN orders o ON u.id = o.user_id
JOIN product p ON o.product_id = p.id
GROUP BY u.name
ORDER BY sum DESC LIMIT 1;

-- 5. Hər məhsulun neçə dəfə sifariş edildiyini tap.
SELECT p.name, SUM(o.quantity) FROM orders o
JOIN product p ON o.product_id = p.id
GROUP BY p.name;

-- 6. Son 30 gün ərzində verilmiş sifarişlər və istifadəçilər.
SELECT u.name, p.name, o.order_date, (p.price * o.quantity)
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN product p ON o.product_id = p.id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 days';

--
SELECT u.name, COUNT(o.id) FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.name
ORDER BY count DESC;
--
SELECT u.name FROM users u
JOIN orders o ON u.id = o.user_id
JOIN product p ON p.id = o.product_id
GROUP BY u.name
HAVING SUM(o.quantity * p.price) > 300;
--
SELECT p.name, AVG(o.quantity) FROM product p
JOIN orders o ON p.id = o.product_id
GROUP BY p.name
ORDER BY avg DESC;