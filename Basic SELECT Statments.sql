USE playcenter;


-- query 1
SELECT *
FROM players;

-- query 2
SELECT last_name , first_name , city
FROM players;

-- query 3
SELECT email_address , country , street_address
FROM players;

-- query 4
SELECT player_id , total_playing_minutes , installed_games
FROM players;

-- query 5
SELECT player_id , age_group ,total_playing_minutes
FROM players;