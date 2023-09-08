
-- query 1
SELECT player_id , amount_spent_usd , amount_spent_usd * 0.8
FROM players;

-- query 2
SELECT player_id, last_name, first_name, amount_spent_usd, installed_games, amount_spent_usd / installed_games 
FROM players;

-- query 3
SELECT player_id, email_address, installed_games, uninstalled_games , uninstalled_games / installed_games
FROM players;

-- query 4
SELECT player_id , CONCAT(first_name , " " , last_name)
FROM players;

-- query 5
SELECT player_id , email_address , CONCAT(country , " " , city , " " , street_address )
FROM players;

-- query 6
SELECT CONCAT(CONCAT(first_name , " " , last_name) , "preferred language is " , preferred_language)
FROM players;