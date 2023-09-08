USE bookreview;

------------------
-- Inner JOIN
------------------

-- query 1 - A
SELECT U.first_name, U.last_name, U.email, U.birthdate, G.gender
FROM users U INNER JOIN genders G
ON U.gender_id = G.gender_id;

-- query 1 - B
SELECT U.first_name, U.last_name, U.email, U.birthdate, G.gender
FROM users U INNER JOIN genders G
ON U.gender_id = G.gender_id
WHERE YEAR(U.birthdate) = 2002;

-- query 1 - C
SELECT YEAR(birthdate), COUNT(*) AS number_of_users
FROM users
GROUP BY YEAR(birthdate)
ORDER BY YEAR(birthdate);

-- query 1 - D
SELECT YEAR(birthdate), COUNT(*) AS number_of_users
FROM users
GROUP BY YEAR(birthdate)
HAVING COUNT(*) > 54
ORDER BY YEAR(birthdate);

-- query 2 - A
SELECT U.first_name, U.last_name, U.email, U.birthdate, L.country, L.city
FROM users U INNER JOIN locations L
ON U.location_id = L.location_id;

-- query 2 - B
SELECT U.first_name, U.last_name, U.email, U.birthdate, L.country, L.city
FROM users U INNER JOIN locations L
ON U.location_id = L.location_id
WHERE L.country = 'United Kingdom';

-- query 2 - C
SELECT L.country, L.city, COUNT(*) AS number_of_users
FROM users U INNER JOIN locations L
ON U.location_id = L.location_id
GROUP BY L.country, L.city
ORDER BY COUNT(*) DESC;

-- query 2 - D
SELECT L.country, L.city, COUNT(*) AS number_of_users
FROM users U INNER JOIN locations L
ON U.location_id = L.location_id
WHERE TIMESTAMPDIFF(YEAR, U.birthdate, CURRENT_TIMESTAMP) > 30
GROUP BY L.country, L.city
ORDER BY COUNT(*) DESC;

-- query 3 - A
SELECT U.first_name, U.last_name, U.email
, TIMESTAMPDIFF(YEAR, U.birthdate, CURRENT_TIMESTAMP) AS age
, O.occupation_name
FROM users U INNER JOIN occupations O
ON U.occupation_id = O.occupation_id;

-- query 3 - B
SELECT O.occupation_name, AVG(TIMESTAMPDIFF(YEAR, U.birthdate, CURRENT_TIMESTAMP)) AS avg_age
FROM users U INNER JOIN occupations O
ON U.occupation_id = O.occupation_id
GROUP BY O.occupation_name;

-- query 3 - C
SELECT O.occupation_name, AVG(TIMESTAMPDIFF(YEAR, U.birthdate, CURRENT_TIMESTAMP)) AS avg_age
FROM users U INNER JOIN occupations O
ON U.occupation_id = O.occupation_id
GROUP BY O.occupation_name
HAVING AVG(TIMESTAMPDIFF(YEAR, U.birthdate, CURRENT_TIMESTAMP)) > 40;

-- query 4
SELECT A.authors, AVG(B.num_pages) AS average_num_pages
FROM books B INNER JOIN authors A
ON B.author_id = A.author_id
GROUP BY A.authors
ORDER BY AVG(B.num_pages) DESC;

-- query 5
SELECT L.language_name, COUNT(*) AS number_of_books
FROM books B INNER JOIN languages L
ON B.language_code = L.language_code
GROUP BY L.language_name
ORDER BY COUNT(*) DESC;

-- query 6
SELECT L.language_name, COUNT(DISTINCT publisher_id) AS number_of_unique_publishers
FROM books B INNER JOIN languages L
ON B.language_code = L.language_code
GROUP BY L.language_name
ORDER BY COUNT(DISTINCT publisher_id) DESC;


------------------
-- Joining Multiple Tables
------------------

-- query 1 -A
SELECT U.first_name, U.last_name, U.email, U.birthdate, O.occupation_name, L.country, L.city
FROM users U
INNER JOIN occupations O ON U.occupation_id = O.occupation_id
INNER JOIN locations L ON U.location_id = L.location_id ;

-- query 1 - B
SELECT O.occupation_name, L.country, COUNT(*) AS number_of_users
FROM users U
INNER JOIN occupations O ON U.occupation_id = O.occupation_id
INNER JOIN locations L ON U.location_id = L.location_id
GROUP BY O.occupation_name, L.country;

-- query 2 - A
SELECT R.rating_id, R.rating_date, R.rating, B.title, CONCAT(U.first_name,' ', U.last_name) AS user_full_name
FROM ratings R 
INNER JOIN books B ON R.book_id = B.book_id
INNER JOIN users U ON R.user_id = U.user_id;

-- query 2 - B
SELECT R.rating_id, R.rating_date, R.rating, B.title, CONCAT(U.first_name,' ', U.last_name) AS user_full_name
FROM ratings R 
INNER JOIN books B ON R.book_id = B.book_id
INNER JOIN users U ON R.user_id = U.user_id
WHERE B.title LIKE '%Harry Potter%';

-- query 3
SELECT L.country, COUNT(DISTINCT U.user_id) AS number_of_unique_users
FROM ratings R 
INNER JOIN books B ON R.book_id = B.book_id
INNER JOIN users U ON R.user_id = U.user_id
INNER JOIN locations L ON U.location_id = L.location_id
WHERE B.title LIKE '%Harry Potter%'
GROUP BY L.country;


------------------
-- LEFT and RIGHT Joins
------------------

-- query 1 - A
SELECT B.title, B.num_pages, P.publisher_name
FROM books B LEFT JOIN publishers P
ON B.publisher_id = P.publisher_id;

-- query 1 - B
SELECT B.title, B.num_pages, P.publisher_name
FROM books B LEFT JOIN publishers P
ON B.publisher_id = P.publisher_id
WHERE P.publisher_name IS NULL;

-- query 2 - A
SELECT B.title, B.num_pages, B.publication_date, A.authors
FROM books B LEFT JOIN authors A
ON B.author_id = A.author_id;

-- query 2 - B
SELECT B.title, B.num_pages, B.publication_date, A.authors
FROM books B LEFT JOIN authors A
ON B.author_id = A.author_id
WHERE A.authors IS NULL;

-- query 3
SELECT COUNT(*) AS never_been_rated
FROM books B LEFT JOIN ratings R
ON B.book_id = R.book_id
WHERE R.rating_id IS NULL;

------------------
-- Self Join
------------------

USE hr;

SELECT id, last_name, first_name, job_title, manager_id, division_name
FROM employees
ORDER BY id;

-- query 1
SELECT E.last_name AS 'employee', M.manager_id AS 'manager'
FROM employees AS E INNER JOIN employees AS M
ON E.manager_id = M.id;

-- query 2
SELECT E.last_name AS 'employee', M.manager_id AS 'manager'
FROM employees AS E LEFT JOIN employees AS M
ON E.manager_id = M.id;

