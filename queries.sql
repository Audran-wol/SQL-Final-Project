-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

--Top 10 Products Sales For Each Day of the Week
SET @rank := 0; # initial value

SELECT day, id, name, total_amount
FROM
    (SELECT id, name, total_amount , day,
    @rank := IF(@current_day = day, @rank + 1, 1) AS rank,
    @current_day := day
    FROM
            (SELECT p.id, p.name , count(*) AS total_amount, o.order_dow AS day
            FROM
            product AS p INNER JOIN
            order_product AS op ON op.product_id = p.id INNER JOIN
            orders AS o ON op.order_id=o.id
            GROUP BY id,name,day
            HAVING day BETWEEN 1 AND 5) AS t1
    ORDER BY day,total_amount DESC) AS t2
WHERE rank<=10;

--Most Popular Products in Each Aisle from Monday to Friday
SET @rank := 0; # initial value

SELECT  aisle, day, id as product_id FROM
    (SELECT day, aisle, id, total_amount, 
    @rank := IF(@current_aisle=aisle AND @current_day = day, @rank + 1, 1) AS rank,
    @current_day := day,
    @current_aisle := aisle
    FROM
            (SELECT p.id ,a.aisle as aisle, count(*) AS total_amount, o.order_dow AS day
            FROM
            product AS p INNER JOIN
            order_product AS op ON op.product_id = p.id INNER JOIN
            orders AS o ON op.order_id=o.id
            INNER JOIN aisles AS a ON p.aisle_id=a.id
            GROUP BY id, a.aisle ,day
            Having day BETWEEN 1 AND 5) AS t1
    ORDER BY aisle, day,total_amount DESC) as t2
WHERE rank<=5;

--Top 10 Products with the Most Frequent Reorder Rate
SELECT product_id
FROM order_product
GROUP BY product_id
ORDER BY sum(reordered)/count(*) DESC
LIMIT 10;

--Shopper’s Aisle List for Each Order
SELECT op.order_id, a.id as aisle_id
FROM order_product AS op
INNER JOIN aisles AS a ON op.product_id=a.id
GROUP BY op.order_id, a.id;

--Most Popular Shopping Path
SELECT aisles, COUNT(*) AS count FROM
    (SELECT order_id, GROUP_CONCAT(DISTINCT(a.id) ORDER BY a.id SEPARATOR ' ') as aisles
    FROM order_product AS op
    INNER JOIN product AS p ON op.product_id=p.id
    INNER JOIN aisles AS a ON p.aisle_id=a.id
    GROUP BY order_id
    HAVING COUNT(DISTINCT(a.id))>=2 ) AS t
GROUP BY aisles
ORDER BY count DESC ;

--Top Pairwise Associations in Products
SELECT p1.name as product1 ,p2.name as product2
FROM
    (SELECT  op1.product_id AS product1, op2.product_id AS product2, COUNT(*) AS count
    FROM order_product AS op1 INNER JOIN
    order_product AS op2 ON op1.order_id=op2.order_id
    WHERE op1.product_id<op2.product_id
    GROUP BY op1.product_id,op2.product_id
    ORDER BY count DESC
    LIMIT 100 ) AS t
INNER JOIN product AS p1 ON t.product1=p1.id
INNER JOIN product AS p2 ON t.product2=p2.id
