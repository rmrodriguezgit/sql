CREATE DATABASE fifasys;

use fifasys;

SELECT *
FROM players;

SELECT *
FROM name_players
WHERE nationality in ('Brazil') and preferred_foot IN ('Right');

SELECT *
FROM players 
WHERE CLUB LIKE  '%Real%'

SELECT AVG(age)
FROM name_players
WHERE nationality in ('Brazil') and preferred_foot IN ('Right');

SELECT count(*) 
FROM name_players
WHERE nationality in ('France');

SELECT sum(age)
FROM name_players
WHERE nationality in ('Netherlands');

SELECT count(*)
FROM name_players
WHERE weight_lbs in ('159lbs');

SELECT count(*)
FROM players
WHERE club in ('Liverpool')

SELECT *
FROM players

SELECT count(*)
FROM players
WHERE club in ('Real Madrid') and potential in (85);

SELECT avg(potential)
FROM players
WHERE club in ('FC Barcelona')

SELECT avg(potential)
FROM players
WHERE position in ('CM') and club in ('Real Madrid');

SELECT stdev(potential)
FROM players
WHERE position in ('CM') and club in ('FC Barcelona');

USE fifasys;
SELECT * from habilities;

-- Dame el club, jugador con una vision mayor igual a 94
-- Lionel Messi
-- Kevin De Bruyne
SELECT NP.name_player, P.club, H.vision
FROM name_players AS NP
JOIN players AS P ON P.name_id = NP.name_id
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE H.vision >= 94;

-- Dame el club, jugador con una vision mayor igual a 90 ordenado de forma descendente
SELECT club,name_player,vision
FROM players as P
JOIN name_players as NP ON NP.name_id = P.name_id
JOIN habilities as H ON H.name_id = P.name_id
WHERE H.vision >= 90
ORDER BY vision DESC;

--  Dame el club, jugador con mejor aceleración
SELECT TOP(1) P.club,NP.name_player,H.aceleration
FROM players as P
JOIN name_players as NP ON NP.name_id = P.name_id
JOIN habilities as H ON H.name_id = P.name_id
ORDER BY H.aceleration DESC

SELECT TOP(1) club,name_player,aceleration
FROM players as P
JOIN name_players as NP ON NP.name_id = P.name_id
JOIN habilities as H ON H.name_id = P.name_id
ORDER BY aceleration ASC;

--  Dame el club, jugador con una agilidad mayor igual a 94 (ABRAHAM)

--  Dame el club, jugador con mejor pase largo (ANA KAREN) ok
SELECT TOP(1) P.club,NP.name_player,H.long_passing
FROM players AS P
JOIN name_players AS NP ON NP.name_id = P.name_id
JOIN habilities AS H ON H.name_id =P.name_id
ORDER BY H.long_passing DESC;
--  Dame el club, jugador con mejor pase corto (ANA PAULA)

--  Dame el club, jugador con peor dribbling (ANDREA CAUDILLO)
SELECT TOP(1) club, name_player, dribbling
FROM players as P
JOIN name_players as NP ON NP.name_id = P.name_id
JOIN habilities as H ON H.name_id = P.name_id
ORDER BY dribbling ASC;

-- Dame el promedio de agilidad del club FC Barcelona (ANDREA DEL ROCIO)

-- Dame el promedio de las estadísticas de los porteros de fifasys (ANDREA LIZETTE)

-- Dame el top ten de los jugadores de mejor salto (ANDREA ROMERO)

-- Dame el top ten de los jugadores de mejor control de balón (CARLOS MANRIQUE)

-- Cual es el promedio de aceleración del Real Madrid (RICARDO)

 