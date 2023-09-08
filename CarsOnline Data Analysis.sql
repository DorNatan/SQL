USE carsonline;

-- query 1 - A
SELECT C.car_id, C.price, CT.car_make, CT.car_model, CT.car_year 
FROM cars C INNER JOIN car_types CT
ON C.car_type_id = CT.car_type_id;

-- query 1 - B
SELECT C.car_id, C.price, CT.car_make, CT.car_model, CT.car_year 
FROM cars C INNER JOIN car_types CT
ON C.car_type_id = CT.car_type_id
WHERE CT.car_make = 'bmw' AND CT.car_year = '2019';

-- query 1 - C
SELECT CT.car_model, AVG(C.price)
FROM cars C INNER JOIN car_types CT
ON C.car_type_id = CT.car_type_id
WHERE CT.car_make = 'bmw' AND CT.car_year = '2019'
GROUP BY CT.car_model;

-- query 2 - A
SELECT C.car_id, C.price, FT.fuel_type_name 
FROM cars C INNER JOIN fuel_types FT
ON C.fuel_type_id = FT.fuel_type_id;

-- query 2 - B
SELECT FT.fuel_type_name, COUNT(*)
FROM cars C INNER JOIN fuel_types FT
ON C.fuel_type_id = FT.fuel_type_id
GROUP BY FT.fuel_type_name
ORDER BY COUNT(*) DESC;

-- query 3 - A
SELECT C.car_id, C.price, TT.transmission_name
FROM cars C INNER JOIN transmission_types TT
ON C.transmission_type_id = TT.transmission_type_id;

-- query 3 - B
SELECT TT.transmission_name, AVG(C.price)
FROM cars C INNER JOIN transmission_types TT
ON C.transmission_type_id = TT.transmission_type_id
GROUP BY TT.transmission_name;

-- query 4
SELECT CT.car_make, COUNT(*)
FROM cars C 
INNER JOIN car_types CT ON C.car_type_id = CT.car_type_id
INNER JOIN fuel_types FT ON C.fuel_type_id = FT.fuel_type_id
WHERE FT.fuel_type_name = 'Hybrid'
GROUP BY CT.car_make
ORDER BY COUNT(*) DESC;

-- query 5
SELECT CT.car_make, CT.car_year, COUNT(*)
FROM cars C 
INNER JOIN car_types CT ON C.car_type_id = CT.car_type_id
INNER JOIN transmission_types TT ON C.transmission_type_id = TT.transmission_type_id
WHERE TT.transmission_name  = 'manual'
GROUP BY CT.car_year, CT.car_make
ORDER BY COUNT(*) DESC;

-- query 6 - A
SELECT C.customer_id, C.first_name, C.last_name, C.birth_date, G.gender
FROM customers C INNER JOIN genders G ON C.gender_code = G.gender_code;

-- query 6 - B
SELECT G.gender, COUNT(*)
FROM customers C INNER JOIN genders G ON C.gender_code = G.gender_code
GROUP BY G.gender;

-- query 6 - C
SELECT G.gender,TIMESTAMPDIFF(YEAR, C.birth_date, CURRENT_TIMESTAMP) AS age, COUNT(*)
FROM customers C INNER JOIN genders G ON C.gender_code = G.gender_code
GROUP BY G.gender, TIMESTAMPDIFF(YEAR, C.birth_date, CURRENT_TIMESTAMP)
ORDER BY COUNT(*) DESC;

-- query 6 - d
SELECT G.gender,TIMESTAMPDIFF(YEAR, C.birth_date, CURRENT_TIMESTAMP) AS age, COUNT(*)
FROM customers C INNER JOIN genders G ON C.gender_code = G.gender_code
WHERE TIMESTAMPDIFF(YEAR, C.birth_date, CURRENT_TIMESTAMP) = 59
GROUP BY G.gender, TIMESTAMPDIFF(YEAR, C.birth_date, CURRENT_TIMESTAMP)
ORDER BY COUNT(*) DESC;

-- query 7 - A
SELECT L.country, COUNT(*) AS number_of_customers
FROM customers C INNER JOIN locations L ON C.location_code = L.location_code
GROUP BY L.country
HAVING L.country = 'Australia';

-- query 7 - B
SELECT L.country, COUNT(*) AS number_of_customers
FROM customers C INNER JOIN locations L ON C.location_code = L.location_code
WHERE C.phone_number IS NOT NULL
GROUP BY L.country
HAVING L.country = 'Australia';

-- query 7 - C
SELECT L.country, L.city, COUNT(*) AS number_of_customers
FROM customers C INNER JOIN locations L ON C.location_code = L.location_code
WHERE C.phone_number IS NULL
GROUP BY L.country, L.city
HAVING L.country = 'Australia'
ORDER BY COUNT(*) DESC;

-- query 8
SELECT S.customer_id, CONCAT(C.first_name,' ', C.last_name), COUNT(*)
FROM sales S INNER JOIN customers C ON S.customer_id = C.customer_id
GROUP BY S.customer_id
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC;

-- query 9
SELECT COUNT(DISTINCT S.sale_id)/ COUNT(C.car_id)*100
FROM cars C LEFT JOIN sales S ON S.car_id = C.car_id;

-- query 10
SELECT CT.car_make, YEAR(S.purchase_date), AVG(C.price) AS 'average_price'
FROM  sales S
INNER JOIN cars C ON S.car_id = C.car_id
INNER JOIN car_types CT ON C.car_type_id = CT.car_type_id
WHERE YEAR(S.purchase_date) = 2019
GROUP BY CT.car_make
HAVING CT.car_make = 'Audi';
