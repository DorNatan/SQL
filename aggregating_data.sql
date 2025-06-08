USE airbnb;

------------------
-- Group Functions
------------------

-- query 1
SELECT AVG(price)
FROM rooms;

-- query 2
SELECT MAX(number_of_reviews)
FROM rooms;

-- query 3
SELECT MIN(reviews_per_month)
FROM rooms;

-- query 4
SELECT COUNT(reviews_per_month)
FROM rooms;

-- query 5
SELECT DISTINCT neighbourhood_group
FROM rooms;

-- query 6
SELECT COUNT(DISTINCT neighbourhood_group)
FROM rooms;

------------------
-- GROUP BY Clause
------------------

-- query 1
SELECT neighbourhood_group, AVG(price)
FROM rooms
GROUP BY neighbourhood_group
ORDER BY AVG(price) DESC;

-- query 2
SELECT price_range, COUNT(price_range)
FROM rooms
GROUP BY price_range;

-- query 3
SELECT room_type, MAX(reviews_per_month)
FROM rooms
GROUP BY room_type;

-- query 4
SELECT number_of_reviews_range, AVG(price)
FROM rooms
GROUP BY number_of_reviews_range;

-- query 5
SELECT neighbourhood, COUNT(*)
FROM rooms
GROUP BY neighbourhood
ORDER BY COUNT(neighbourhood) DESC;

-- query 6
SELECT neighbourhood,neighbourhood_group, COUNT(*)
FROM rooms
GROUP BY neighbourhood, neighbourhood_group
ORDER BY neighbourhood_group;

-- query 7
SELECT neighbourhood,neighbourhood_group, COUNT(neighbourhood)
FROM rooms
WHERE neighbourhood_group IN('Manhattan', 'Queens')
GROUP BY neighbourhood, neighbourhood_group
ORDER BY neighbourhood_group;

-- query 8
SELECT neighbourhood, AVG(number_of_reviews)
FROM rooms
WHERE neighbourhood_group = 'Brooklyn'
GROUP BY neighbourhood;

------------------
-- HAVING Clause
------------------

-- query 1
SELECT host_name, COUNT(*)
FROM rooms
GROUP BY host_name
HAVING COUNT(*) > 100;

-- query 2
SELECT neighbourhood , AVG(price)
FROM rooms
GROUP BY neighbourhood
HAVING AVG(price) > 150;

-- query 3
SELECT neighbourhood , AVG(price)
FROM rooms
WHERE neighbourhood_group = 'Bronx'
GROUP BY neighbourhood
HAVING AVG(price) > 150;

-- query 4
SELECT neighbourhood_group, room_type , AVG(number_of_reviews)
FROM rooms
GROUP BY neighbourhood_group, room_type
ORDER BY neighbourhood_group;

-- query 5
SELECT neighbourhood_group, room_type , AVG(number_of_reviews)
FROM rooms
GROUP BY neighbourhood_group, room_type
HAVING AVG(number_of_reviews) > 20
ORDER BY neighbourhood_group;

-- query 6
SELECT neighbourhood_group, room_type , AVG(number_of_reviews)
FROM rooms
WHERE room_type = 'private room'
GROUP BY neighbourhood_group, room_type
HAVING AVG(number_of_reviews) > 20
ORDER BY neighbourhood_group;