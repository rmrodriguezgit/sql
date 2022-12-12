use inegi;
select * from estados;

call obtener_estado('11', @numero);
SELECT @numero as num_municipios

-- Crear un procedimiento almacenado que regrese la abreviatura del estado según la clave
-- obtener_abrev('11') -> Regresa Gto.alter

-- Crear un procedimiento almacenado que regrese la información del estado según la clave
-- obtener_estado('11) 

-- Crear un procedimiento almacenado que regrese el número de municipios del estado según la clave
-- obtener_num_municipios('11')

-- Crear un procedimiento almacenado que regrese el listado de municipios del estado según la clave
-- obtener_municipios('11') 

-- Crear un procedimiento almacenado que regrese el estado que corresponde al municipio 
-- obtener_estado_municipio('León');


 
