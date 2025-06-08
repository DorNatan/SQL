USE spotify;

-- query 1
SELECT artist, COUNT(*)
FROM tracks
GROUP BY artist
ORDER BY COUNT(*) DESC;

-- query 2
SELECT genre, AVG(duration)
FROM tracks
GROUP BY genre
ORDER BY AVG(duration) DESC;

-- query 3
SELECT artist, MIN(danceability), MAX(danceability), AVG(danceability)
FROM tracks
WHERE artist IN ('Queen', 'The Beatles')
GROUP BY artist;

-- query 4
SELECT COUNT(DISTINCT genre) 'unique_pop_genres'
FROM tracks
WHERE genre LIKE '%POP%';

-- query 5
SELECT artist,genre, MAX(popularity), MIN(popularity), COUNT(*)
FROM tracks
WHERE genre LIKE '%rock%'
GROUP BY artist, genre
ORDER BY COUNT(*) DESC;

-- query 6 - A
SELECT genre, release_year, COUNT(*)
FROM tracks
WHERE release_year BETWEEN 2005 AND 2010
GROUP BY genre;

-- query 6 - B
SELECT genre, release_year, COUNT(*)
FROM tracks
WHERE release_year BETWEEN 2005 AND 2010
GROUP BY genre
HAVING COUNT(*) > 10;

-- query 7
SELECT artist, release_year, COUNT(*)
FROM tracks
WHERE artist = 'Coldplay' 
GROUP BY artist, release_year
ORDER BY release_year;