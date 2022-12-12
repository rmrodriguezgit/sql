create database bd_casaBolsa;
use bd_casaBolsa;

DROP TABLE IF EXISTS tb_divisas;
CREATE TABLE tb_divisas(
id_div INT NOT NULL AUTO_INCREMENT,
abrev VARCHAR(3),
descripcion VARCHAR(100),
valor decimal(19,2),
reserva decimal(19,2),
fecha_act DATE,
PRIMARY KEY (id_div)
);

select * 
from tb_divisas;

UPDATE tb_divisas SET valor = 21.40, fecha_act = now()
WHERE abrev = 'USD' and id_div >=1;


DROP TABLE IF EXISTS tb_venta_divisas;
CREATE TABLE tb_venta_divisas(
id_venta INT NOT NULL AUTO_INCREMENT,
ine VARCHAR(100),
abrev VARCHAR(3),
valor decimal(19,2),
cantidad int,
total decimal(19,2),
fecha_act DATE,
PRIMARY KEY (id_venta)
);

select *
from tb_venta_divisas;



