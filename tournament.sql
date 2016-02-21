-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- Check and drop if the tournament Db exists
DROP DATABASE IF EXISTS tournament;

--Create tournament Db
CREATE DATABASE tournament;

--Connect to the database
\connect tournament

--Create player table
CREATE TABLE player (
	player_id SERIAL PRIMARY KEY, 
	player_name TEXT
);

CREATE TABLE match (
	match_id SERIAL PRIMARY KEY, 
	winner INTEGER, 
	loser INTEGER,
	FOREIGN KEY(winner) REFERENCES player(player_id),
	FOREIGN KEY(loser) REFERENCES player(player_id)
);

--Create view standings
CREATE VIEW standings
	AS
	(SELECT a.player_id as id, a.player_name as name, 
			COALESCE(b.wins,0) AS wins, 
	  		(COALESCE(b.wins,0)+COALESCE(c.losses,0)) as matches, 
	  		RANK() OVER (ORDER BY wins DESC) AS ran
		FROM player a 
			LEFT JOIN (SELECT winner, COUNT(match_id) AS wins 
					FROM match GROUP BY winner) b
					ON a.player_id = winner
			LEFT JOIN (SELECT loser, count(match_id) AS losses FROM match GROUP BY loser) c
					ON a.player_id = c.loser
	);

--Create view pairings
CREATE VIEW pairings
	AS
	(WITH temp 
		AS
		(SELECT *, CEILING(1.0* ROW_NUMBER() OVER (ORDER BY wins, id)/2) as roundrank 
			from standings
		)

	SELECT a.id AS id1,
		   a.name AS name1,
		   b.id AS id2,
		   b.name AS name2, 
		   a.ran 
		FROM temp a INNER JOIN temp b
			ON a.roundrank = b.roundrank
			AND a.id<b.id 
	);