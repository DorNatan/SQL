USE netflix;

-- query 1
SELECT title, rating, country, release_year, director
FROM movies
WHERE director = "Michael Bay"
ORDER BY release_year;

-- query 2
SELECT title, country, duration_in_minutes, date_added
FROM movies
WHERE DATE(date_added) < "2011-03-01"
ORDER BY duration_in_minutes;

-- query 3
SELECT title, country, duration_in_minutes, release_year
FROM movies
WHERE release_year BETWEEN 2014 AND 2016
ORDER BY duration_in_minutes DESC;

-- query 4
SELECT title, director, country, duration_in_minutes
FROM movies
WHERE duration_in_minutes/60 BETWEEN 3 AND 4
ORDER BY duration_in_minutes DESC;

-- query 5
SELECT title, director, rating, num_of_seasons
FROM series
WHERE num_of_seasons BETWEEN 10 AND 14
ORDER BY num_of_seasons DESC;

-- query 6
SELECT title, director, rating, num_of_seasons
FROM series
WHERE director IS NOT NULL AND num_of_seasons > 7;

-- query 7
SELECT title, director, cast, country, rating
FROM movies
WHERE cast LIKE "%Ryan Reynolds%";

-- query 8
SELECT title, director, cast, country, rating
FROM movies
WHERE cast LIKE "%Ryan Reynolds%" AND cast LIKE "%Nicolas Cage%";

-- query 9
SELECT title, director, cast, country, duration_in_minutes, rating
FROM movies
WHERE rating LIKE "%PG%" AND duration_in_minutes/60 > 3;

-- query 10
SELECT title, director, cast, country, release_year 
FROM movies
WHERE release_year IN (2014,2016,2018)
ORDER BY title;