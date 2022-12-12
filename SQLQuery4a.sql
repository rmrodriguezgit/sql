-- 67759 Barroso Gomez Mayte Lucia 
-- Promedio de edad de los jugadores españoles con mejor long_passing y mejor aceleration 
SELECT NP.age, NP.name_id, NP.name_player
FROM name_players AS NP 
JOIN habilities AS H ON H.name_id =NP.name_id
WHERE nationality= 'spain';

SELECT TOP (5)  H.long_passing, NP.nationality, NP.name_player
FROM habilities AS H
JOIN name_players AS NP ON NP.name_id =H.name_id
WHERE nationality= 'spain'
ORDER BY H.long_passing DESC;

SELECT TOP (5) H.aceleration, NP.nationality, NP.name_player
FROM habilities AS H
JOIN name_players AS NP ON NP.name_id =H.name_id
WHERE nationality= 'spain'
ORDER BY H.aceleration DESC;

SELECT TOP (5) NP.age,NP.name_id
FROM name_players as NP
join habilities AS H ON H.name_id=NP.name_id
WHERE H.aceleration>=80 AND H.long_passing>=80;

SELECT AVG(NP.age) AS [Promedio de edad]
FROM name_players as NP
JOIN habilities as H  On H.name_id=NP.name_id
where  H.aceleration>=80 AND H.long_passing>=80 and 
NP.name_id IN (1,3,6,16,68);

-- 69643 Durán Castillo Christopher Emmanuel 
-- Jugadores transferibles del Villareal CF que en un top 5 de peores habilidades 
-- en short_passing, long_passing, menores de 32 años, stamina, finishing

SELECT TOP (10) NP.name_player, P.club, NP.age, H.short_passing
FROM name_players AS NP
JOIN habilities AS H ON H.name_id = NP.name_id
JOIN players AS P ON P.name_id = NP.name_id
WHERE NP.age < 32 AND P.club = 'Villarreal CF' 
ORDER BY H.short_passing;
--Sergio Asenjo Andrv©s
--Simv=n Moreno Barroso
--Eduardo David Espiau Hernv°ndez
--Josv© Castav±o Muv±oz
--Sofian Chakla
--Andrei Ravà‚Ä?iu
--Carlos Blanco Moreno
--Ramiro Guerra
--Ivv°n Martv?n Nv?v±ez
--Sergio Lozano Lluch
 
SELECT TOP (10) NP.name_player, P.club, NP.age, H.long_passing
FROM name_players AS NP
JOIN habilities AS H ON H.name_id = NP.name_id
JOIN players AS P ON P.name_id = NP.name_id
WHERE NP.age < 32 AND P.club = 'Villarreal CF' 
ORDER BY H.long_passing;
--Simv=n Moreno Barroso
--Sergio Asenjo Andrv©s
--Eduardo David Espiau Hernv°ndez
--Sofian Chakla
--Josv© Castav±o Muv±oz
--Samuel Chukwueze
--Gerard Moreno Balaguerv=
--Karl Toko-Ekambi
--Andrei Ravà‚Ä?iu
--Ramiro Funes Mori
 
SELECT TOP (10) NP.name_player, P.club, NP.age, H.stamina
FROM name_players AS NP
JOIN habilities AS H ON H.name_id = NP.name_id
JOIN players AS P ON P.name_id = NP.name_id
WHERE NP.age < 32 AND P.club = 'Villarreal CF' 
ORDER BY H.stamina;
--Leonardo Suv°rez
--Sergio Asenjo Andrv©s
--Carlos Blanco Moreno
--Ivv°n Martv?n Nv?v±ez
--Sofian Chakla
--Ramiro Guerra
--Josv© Castav±o Muv±oz
--Andrei Ravà‚Ä?iu
--Eduardo David Espiau Hernv°ndez
--Sergio Lozano Lluch
 
SELECT TOP (10) NP.name_player, P.club, NP.age, H.finishing
FROM name_players AS NP
JOIN habilities AS H ON H.name_id = NP.name_id
JOIN players AS P ON P.name_id = NP.name_id
WHERE NP.age < 32 AND P.club = 'Villarreal CF' 
ORDER BY H.finishing;
--Carlos Blanco Moreno
--Sergio Asenjo Andrv©s
--Sofian Chakla
--Pau Francisco Torres
--Josv© Castav±o Muv±oz
--Ramiro Funes Mori
--Andrv©-Franck Zambo Anguissa
--Andrei Ravà‚Ä?iu
--Xavier QuintillvÉ¬† Guasch
--Sergio Lozano Lluch
 
--5 Jugadores Transferibles, Respuesta:
--Sergio Asenjo Andrv©s
--Sofian Chakla
--Josv© Castav±o Muv±oz
--Andrei Ravà‚Ä?iu
--Eduardo David Espiau Hernv°ndez

-- 68656 Frias Sanchez Jimena 
-- Jugadores seleccionables por Brazil menores de 22 años que tengan ball_control, agression
SELECT TOP (25) NP.name_player, NP.nationality, NP.age, H.ball_control
FROM name_players AS NP
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE age <= 22 AND nationality = 'Brazil'
ORDER BY H.ball_control DESC;

SELECT TOP (25) NP.name_player, NP.nationality, NP.age, H.agresion
FROM name_players AS NP
JOIN habilities AS H ON H.name_id = NP.name_id
WHERE age <= 22 AND nationality = 'Brazil'
ORDER BY H.agresion DESC;

-- 69432 Garcia Covian José Mauricio 
-- Jugadores por comprar que cumplan criterios Delantero (ST), shot_power, sprint_speed holandeses menores de 23 años

Para el shot power
SELECT TOP(10) N.name_id, N.age, N.name_player, H.shot_power, H.sprint_speed, 
P.club, P.position, P.value_market, N.nationality
FROM players AS P
JOIN habilities AS H ON P.name_id = H.name_id
JOIN name_players AS N ON P.name_id = N.name_id
WHERE N.nationality = 'Netherlands'
AND N.age < 23
AND P.position = 'ST'
ORDER BY H.shot_power DESC

Para el sprint
SELECT TOP(10) N.name_id, N.age, N.name_player, H.shot_power, H.sprint_speed, P.club, P.position, 
P.value_market, N.nationality
FROM players AS P
JOIN habilities AS H ON P.name_id = H.name_id
JOIN name_players AS N ON P.name_id = N.name_id
WHERE N.nationality = 'Netherlands'
AND N.age < 23
AND P.position = 'ST'
ORDER BY H.sprint_speed DESC 
