USE job_adverts;

------------------
-- Part 1
------------------

-- query 1-A
SELECT job_id, job_title, salary_estimate_min, salary_estimate_max
FROM jobs;

-- query 1-B
SELECT job_id, job_title, salary_estimate_min, salary_estimate_max
FROM jobs
WHERE REPLACE(salary_estimate_max, 'K' , '000') < 105000;

-- query 2
SELECT company_name, company_rank, REPLACE(company_size_min, ' Employees' , '') AS company_size_min,
REPLACE(company_size_max, ' Employees' , '') AS company_size_max
FROM jobs
WHERE REPLACE(company_size_min, ' Employees' , '') > 60 AND 
REPLACE(company_size_max, ' Employees' , '') < 120;

-- query 3
SELECT job_id, UPPER(job_title), LOWER(company_name)
FROM jobs;

-- query 4
SELECT job_id, company_name, headquarters_of_company, SUBSTRING(company_name,1,1) AS FL, 
SUBSTRING(headquarters_of_company,1,1) AS FL2
FROM jobs;

-- query 5
SELECT job_id, company_name, headquarters_of_company, 
CONCAT(SUBSTRING(company_name,1,1),SUBSTRING(headquarters_of_company,1,1)) AS company_code
FROM jobs;

-- query 6
SELECT job_id, company_name, headquarters_of_company, 
LOWER(CONCAT(SUBSTRING(company_name,1,1),SUBSTRING(headquarters_of_company,1,1))) AS company_code
FROM jobs;

-- query 7
SELECT  job_title
FROM jobs
WHERE LENGTH(job_title) > 29;

-- query 8
SELECT company_name, company_rank, company_market_value, ROUND(company_market_value,2) AS company_market_value_rounded,
FLOOR(company_market_value) AS FLOOR, CEIL(company_market_value) AS CEIL
FROM jobs;


------------------
-- Part 2
------------------

-- query 1
SELECT job_id, job_title, published_date, removed_date
FROM jobs
WHERE YEAR(published_date) = 2016;

-- query 2
SELECT job_id, job_title, company_name, published_date, removed_date
FROM jobs
WHERE YEAR(published_date) = 2017 AND MONTH(published_date) = 01;

-- query 3
SELECT job_id, job_title, company_name, published_date, removed_date
FROM jobs
WHERE TIMESTAMPDIFF(DAY, published_date, removed_date) = 1;

-- query 4
SELECT job_id, job_title, company_name, published_date
FROM jobs
WHERE MONTH(published_date) = MONTH(CURRENT_TIMESTAMP) AND DAY(published_date) = DAY(CURRENT_TIMESTAMP);

-- query 5
SELECT job_id, job_title, company_name, published_date,removed_date
FROM jobs
WHERE DATE(published_date) > DATE(removed_date);

-- query 6
SELECT job_id, job_title, company_name
FROM jobs
WHERE removed_date IS NULL OR company_name IS NULL OR headquarters_of_company IS NULL;

-- query 7
SELECT job_id, job_title, IFNULL(company_name,'Not Available') AS company_name, IFNULL(headquarters_of_company,state_of_company) headquarters_of_company,
IFNULL(removed_date, CURRENT_DATE) AS removed_date
FROM jobs
WHERE removed_date IS NULL OR company_name IS NULL OR headquarters_of_company IS NULL;

-- query 8
SELECT company_name, ROUND(company_market_value,2), 
CASE
WHEN company_market_value BETWEEN 0 and 300 THEN 'low range'
WHEN company_market_value BETWEEN 301 and 600 THEN 'mid range'
WHEN company_market_value BETWEEN 601 and 900 THEN 'high range'
ELSE 'other range'
END AS 'company_market_value_rank'
FROM jobs;

-- query 9
SELECT job_title, company_name, company_size_min, company_size_max,
CASE
WHEN REPLACE(company_size_max, ' Employees' , '') > 180 THEN 'Large Company'
WHEN REPLACE(company_size_max, ' Employees' , '') > 120 THEN 'Medium Company'
WHEN REPLACE(company_size_max, ' Employees' , '') > 60 THEN 'Small Company'
ELSE 'Unknown'
END AS 'company_size'
FROM jobs;