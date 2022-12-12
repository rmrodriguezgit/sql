CREATE DATABASE fifasysprueba;

USE fifasysprueba;
GO

CREATE TABLE players (
player_id INTEGER PRIMARY KEY,
name_id INTEGER NOT NULL,
potential INTEGER NOT NULL,
club VARCHAR (30) NOT NULL,
logo_url VARCHAR (500),
value_market VARCHAR(30) NOT NULL,
position VARCHAR (3) NOT NULL 
);

SELECT * FROM players;


CREATE TABLE name_players(
name_id INTEGER PRIMARY KEY,
name_player VARCHAR(100) NOT NULL,
age INTEGER  NOT NULL,
photourl VARCHAR(500),
nationality VARCHAR(80) NOT NULL,
flag_url VARCHAR(80) NOT NULL,
preferred_foot VARCHAR(10) NOT NULL,
height_ft VARCHAR(15) NOT NULL,
weight_lbs VARCHAR(10) NOT NULL
);
