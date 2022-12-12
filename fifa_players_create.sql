
CREATE TABLE players (	
	player_id  INTEGER  PRIMARY  KEY,
	name_id  INTEGER NOT NULL,
	potential INTEGER NOT NULL,
	club VARCHAR(50) NOT NULL,
	logo_url VARCHAR(150) NOT NULL,
	value_market VARCHAR(30) NOT NULL,
	position VARCHAR(5) NOT NULL
);	
