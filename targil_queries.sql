Dor Natan 315533067


Q1#

SELECT*
FROM hotels
WHERE city = "Haifa"
ORDER BY hotel_rank ;


Q2#

SELECT hotels.hotel_code,hotel_name,city,room_number,price
FROM rooms JOIN hotels USING (hotel_code)
WHERE price BETWEEN 170 AND 380 ;


Q3#

SELECT hotels.hotel_code, hotel_name, city, type, sum(number_of_rooms)
FROM rooms JOIN hotels USING (hotel_code)
GROUP BY type, hotel_name ;


Q4#

SELECT hotels.hotel_code, hotel_name, city, COUNT(number_of_rooms)
FROM hotels JOIN rooms USING (hotel_code)
WHERE price > 186
GROUP BY hotel_name
ORDER BY COUNT(number_of_rooms) ;


Q5#

SELECT hotel_name, city, room_number, MAX(price)
FROM hotels NATURAL JOIN rooms ;


Q6#

SELECT hotels.hotel_code, hotel_name, city, room_number, price
FROM hotels, rooms
where hotels.hotel_code = rooms.hotel_code
ORDER BY price desc
limit 1 ;


Q7#

SELECT hotels.hotel_code, hotel_name, city, type, AVG(price)
FROM rooms JOIN hotels USING (hotel_code)
GROUP BY hotel_name, type ;


Q8#

SELECT hotels.hotel_code, hotel_name, hotels.city, guests.name, guests.city
FROM hotels JOIN reservation USING (hotel_code) JOIN guests USING (id)
WHERE from_date < "2010-06-28" AND to_date > "2010-06-28"
GROUP BY hotels.hotel_code ;


Q9#

select city, COUNT(hotel_code)
from hotels
WHERE hotel_rank = 4 
GROUP BY city ;


Q10#

SELECT hotels.hotel_code, hotel_name,
CASE
 WHEN price < 100 
     THEN "cheap"
     ELSE "expensive"
END AS "cheap/expensive"
FROM hotels JOIN rooms USING (hotel_code)
GROUP BY hotels.hotel_code ;


Q11#

SELECT hotels.hotel_code, hotel_name, city, COUNT(id) AS "number of reservation"
FROM hotels JOIN reservation USING (hotel_code)
GROUP BY hotels.hotel_code ;


Q12#

SELECT hotel_rank, AVG(DATEDIFF(to_date, from_date))
FROM hotels JOIN reservation USING (hotel_code)
GROUP BY hotel_rank ;


Q13#

SELECT  DISTINCT hotels.hotel_code,hotel_name, name
FROM hotels LEFT JOIN reservation USING (hotel_code) LEFT JOIN guests USING (id)