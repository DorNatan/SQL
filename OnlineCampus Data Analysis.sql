USE	onlinecampus;

-- query 1
SELECT *
FROM courses;

-- query 2
SELECT course_id, price_usd, num_students, content_duration_minutes
FROM courses;

-- query 3
SELECT course_title, num_students, positive_reviews + negative_reviews AS `total_reviews`, (positive_reviews + negative_reviews) / num_students AS "the ratio between the total_reviews & num_students"
FROM courses;

-- query 4
SELECT course_id, course_title, num_lessons, content_duration_minutes, content_duration_minutes / num_lessons AS "average duration for each lecture"
FROM courses;

-- query 5
SELECT course_id, course_title, num_students, price_usd, num_students * price_usd AS "Total course revenues in USD"
FROM courses;

-- query 6
SELECT course_id, CONCAT(course_subject, " ", course_title)
FROM courses;

-- query 7
SELECT course_id, price_usd, content_duration_minutes, content_duration_minutes/60  "content duration in hours"
FROM courses;

-- query 8
SELECT DISTINCT course_subject 
FROM courses;

-- query 9
SELECT DISTINCT course_level
FROM courses;

-- query 10
SELECT DISTINCT course_subject, course_level
FROM courses;
