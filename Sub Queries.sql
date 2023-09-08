USE students_survey;

------------------
-- Single Row Subqueries
------------------

-- query 1
SELECT student_id, full_name, university_id
FROM survey
WHERE university_id = (SELECT university_id
					   FROM survey
					   WHERE student_id = 6043);
			
-- query 2
SELECT survey_id, survey_date
FROM survey
WHERE survey_date = (SELECT survey_date
					   FROM survey
					   WHERE survey_id = 532);
                       
-- query 3
SELECT student_id, full_name, height_cm
FROM survey
WHERE height_cm > (SELECT height_cm
				   FROM survey
				   WHERE full_name = 'Josephina Athow');
                   
-- query 4
SELECT student_id, full_name, age
FROM survey
WHERE age < (SELECT age
			FROM survey
			WHERE survey_id = 10);
            
-- query 5
SELECT student_id, full_name, father_job
FROM survey
WHERE father_job = (SELECT father_job
					FROM survey
					WHERE full_name = 'Christina Rediers');
                    
-- query 6
SELECT student_id, full_name, father_job, mother_job
FROM survey
WHERE father_job = 
	(SELECT father_job
	FROM survey
	WHERE full_name = 'Christina Rediers')
AND mother_job = 
	 (SELECT mother_job
	 FROM survey
	 WHERE full_name = 'Christina Rediers');

-- query 7
SELECT student_id, full_name, age
FROM survey
WHERE age > 
	(SELECT AVG(age)
	FROM survey);
    
-- query 8
SELECT student_id, full_name, age, height_cm
FROM survey
WHERE age > 
	(SELECT AVG(age)
	FROM survey)
AND height_cm >
	(SELECT AVG(height_cm)
	FROM survey);

------------------
-- Multiple Row Subqueries
------------------

-- query 1
SELECT student_id, full_name, age, academic_major
FROM survey
WHERE academic_major IN (SELECT academic_major
					   FROM survey
					   WHERE age > 40);
                       
-- query 2
SELECT student_id, full_name, age, academic_major
FROM survey
WHERE academic_major = 'Philosophy'
AND age IN
	(SELECT DISTINCT age
	FROM survey
	WHERE academic_major = 'Medical physics');