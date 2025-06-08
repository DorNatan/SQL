USE hr;

------------------
-- String Functions
------------------

-- query 1
SELECT id, LOWER(first_name), UPPER(last_name)
FROM employees
WHERE id BETWEEN 80 and 150;

-- query 2
SELECT first_name, last_name, CONCAT(SUBSTRING(first_name,1,1),SUBSTRING(last_name,1,3), '@gmail.com')
FROM employees;

-- query 3
SELECT first_name, last_name, LOWER(CONCAT(SUBSTRING(first_name,1,1),SUBSTRING(last_name,1,3), '@gmail.com')) AS Email
FROM employees;

-- query 4
SELECT id, first_name, last_name, REPLACE(phone_number,'-','.') AS phone_number
FROM employees;

-- query 5
SELECT id, first_name, last_name, job_title, department_id
FROM employees
WHERE LENGTH(job_title) > 35;

------------------
-- Numeric Functions
------------------

-- query 1
SELECT first_name, salary, salary*1.12, ROUND(salary*1.12), FLOOR(salary*1.12)
FROM employees;

------------------
-- Datetime Functions
------------------

-- query 1
SELECT first_name, hire_date, DATE_ADD(hire_date, INTERVAL 10 DAY),
DATE_ADD(hire_date, INTERVAL 1 MONTH),
TIMESTAMPDIFF(DAY, hire_date, CURRENT_TIMESTAMP)
FROM employees;

-- query 2
SELECT first_name, last_name, birth_date,
TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP)
FROM employees;

-- query 3
SELECT first_name, last_name, birth_date
FROM employees
WHERE MONTH(birth_date) = MONTH(CURRENT_TIMESTAMP) AND DAY(birth_date) = DAY(CURRENT_TIMESTAMP);

------------------
-- NULL Handling
------------------

-- query 1
SELECT id, first_name, marital_status, salary
FROM employees
WHERE marital_status IS NULL OR salary IS NULL;

-- query 2
SELECT id, first_name, IFNULL(marital_status,'Unknown Status'), IFNULL(salary,0)
FROM employees
WHERE marital_status IS NULL OR salary IS NULL;

------------------
-- CASE Statement
------------------

-- query 1
SELECT first_name, last_name, salary,
CASE
WHEN salary BETWEEN 15001 and 20000 THEN 'Grade C'
WHEN salary BETWEEN 5001 and 15000 THEN 'Grade B'
WHEN salary BETWEEN 0 and 500 THEN 'Grade A'
ELSE 'Grade D'
END AS GRADES
FROM employees;

-- query 2
SELECT first_name, last_name, birth_date, TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) AS age,
CASE
WHEN TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) BETWEEN 41 and 60 THEN '41-60'
WHEN TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) BETWEEN 21 and 40 THEN '21-40'
WHEN TIMESTAMPDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) BETWEEN 0 and 20 THEN '0-20'
ELSE '60+'
END AS 'age_grades'
FROM employees;