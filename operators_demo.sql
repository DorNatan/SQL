-- Operators:

USE umart;
-- IN Operator

-- query 1
SELECT order_priority, discount, customer_name, customer_region
FROM orders
WHERE customer_region IN('Central', 'West');

-- query 2
SELECT order_id, ship_mode, customer_segment, product_id
FROM orders
WHERE customer_segment NOT IN( 'Small Business', 'Corporate');

-- BETWEEN Operator

-- query 1
SELECT order_id, ship_mode, customer_segment, unit_price 
FROM orders
WHERE unit_price BETWEEN 10 AND 20;

-- query 2
SELECT order_id, discount, unit_price, amount_of_products, profit, discount 
FROM orders
WHERE profit BETWEEN 100 AND 200;

-- LIKE Operator

-- query 1
SELECT customer_id, customer_name
FROM orders
WHERE customer_name LIKE "E%";

-- query 2
SELECT customer_id, customer_name
FROM orders
WHERE customer_name LIKE "%E";

-- query 3
SELECT customer_id, customer_name
FROM orders
WHERE customer_name LIKE "%E%";

-- query 4
SELECT customer_id, customer_name
FROM orders
WHERE customer_name LIKE "A%" OR customer_name LIKE "E%";

-- query 5
SELECT customer_id, customer_name
FROM orders
WHERE customer_name LIKE "%E" OR customer_name LIKE "%I";

-- IS NULL Operator

-- query 1
SELECT DISTINCT customer_id, customer_country, customer_region
FROM orders
WHERE customer_region IS NULL;

-- AND & OR Operators

-- query 1
SELECT order_priority, discount, shipping_cost, ship_mode, discount
FROM orders
WHERE order_priority =  'High' AND ship_mode = 'Regular Air';

-- query 2
SELECT order_priority, discount, shipping_cost, ship_mode
FROM orders
WHERE order_priority =  'High' OR ship_mode = 'Regular Air';

-- query 3
SELECT order_id, customer_id, customer_region, customer_country, customer_segment
FROM orders
WHERE customer_segment IN ( 'Small Business', 'Corporate') AND 
	  customer_region NOT IN ('North', 'South');
      
-- query 4
SELECT order_id, discount, unit_price, profit 
FROM orders
WHERE profit BETWEEN 100 AND 200 AND discount NOT BETWEEN 0.1 AND 0.5;

-- ORDER BY Clause

-- query 1
SELECT order_id, discount, unit_price, profit
FROM orders
WHERE profit > 100
ORDER BY discount DESC;

-- query 2
SELECT order_id, discount, unit_price, profit
FROM orders
WHERE profit > 100
ORDER BY discount DESC, profit;

-- LIMIT Statement

-- query 1
SELECT row_id, order_priority, unit_price, shipping_cost, customer_name
FROM orders
ORDER BY shipping_cost
LIMIT 5;

-- query 2
SELECT row_id, order_priority, unit_price, shipping_cost, profit
FROM orders
ORDER BY profit 
LIMIT 3;