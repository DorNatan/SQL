USE umart;

-- query 1
SELECT row_id, discount, unit_price, customer_id
FROM orders
WHERE customer_id = 3;

-- query 2
SELECT order_id, shipping_cost, customer_name
FROM orders
WHERE customer_name = 'Skyler Youster';

-- query 3
SELECT order_id, order_date, customer_region, customer_country
FROM orders
WHERE order_date < "2012-01-01";

-- query 4
SELECT customer_segment, customer_id, customer_name
FROM orders
WHERE customer_segment = 'Corporate';