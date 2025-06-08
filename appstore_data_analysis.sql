USE appstore;

-- query 1
SELECT app_id, app_name, category, reviews
FROM apps
WHERE reviews > (SELECT reviews
				 FROM apps
				 WHERE app_id = 64);

-- query 2
SELECT app_name, category, size_in_mb, rating
FROM apps
WHERE category = (SELECT category
				 FROM apps
				 WHERE app_name = 'Redhold');
                 
-- query 3
SELECT app_name, category, app_version, last_updated
FROM apps
WHERE last_updated  < (SELECT last_updated 
					   FROM apps
					   WHERE app_id = 29);
                       
-- query 4
SELECT app_name, category, app_version, rating
FROM apps
WHERE rating > (SELECT AVG(rating)
				 FROM apps);
                 
-- query 5
SELECT DISTINCT category
FROM apps
WHERE size_in_mb IN (SELECT size_in_mb
					FROM apps
                    WHERE category = 'education');
                    
-- query 6 - A
SELECT category, MIN(rating)
FROM apps
WHERE category = 'Education';

-- query 6 - B
SELECT category, MAX(rating)
FROM apps
WHERE category = 'Education';  

-- query 6 - C
SELECT app_name, rating
FROM apps
WHERE rating >= (SELECT MIN(rating) FROM apps WHERE category = 'Education')
AND rating <= (SELECT MAX(rating) FROM apps WHERE category = 'Education');   

-- query 7
SELECT app_id, app_name, rating, reviews
FROM apps
WHERE rating > (SELECT rating FROM apps WHERE app_id = 131)
AND reviews > (SELECT reviews FROM apps WHERE app_id = 28);
