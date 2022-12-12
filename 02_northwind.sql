use northwind

-- 1. Crear una consulta que muestre el nombre de empleado 
-- y el número de empleados que cada uno de los empleados tiene a su cargo.

select jefe.lastname,COUNT(empleado.lastname)
from employees jefe 
inner join employees empleado 
on jefe.employeeid=empleado.reportsto
GROUP BY jefe.lastname

-- 2. Mostrar una consulta que muestre el nombre del producto, 
-- el número de unidades totales vendidas, de aquel producto del que mas unidades haya vendido la empresa.

select productname, unitsonorder
from products
where unitsonorder= (SELECT MAX(unitsonorder)from products )

-- 3. Mostrar una consulta que obtenga el nombre de empleado, 
-- el número de pedidos que ha tramitado, y el dinero que ha generado en la empresa, de todos aquellos empleados que han tramitado pedidos. En caso de existir algún empleado que no haya tramitado pedidos se mostrará en las columnas número de pedidos y generado un valor nulo.

select empleado.lastname,COUNT( pedidos.employeeid ),SUM( pedidos.freight )
from employees empleado 
left outer join orders pedidos 
on empleado.employeeid=pedidos.employeeid
group by empleado.lastname,pedidos.employeeid

-- 4. Modificar el ejercicio anterior para que muestre en los valores nulos 
-- de las columnas número de pedidos y dinero generado un 0.

select empleado.lastname,COUNT( pedidos.employeeid ),
case when SUM( pedidos.freight ) is null 
     then 0 
	 else SUM( pedidos.freight ) 
end
from employees empleado 
left outer join orders pedidos 
on empleado.employeeid=pedidos.employeeid
group by empleado.lastname,pedidos.employeeid

-- 5. Modificar el ejercicio anterior para que muestre en lugar de un 
-- 0 las cadenas "Sin Pedidos" y "Sin dinero".

select empleado.lastname,
case when COUNT( pedidos.employeeid )=0 
     then cast('Sin pedidos' as VARCHAR) 
	 else cast( COUNT( pedidos.employeeid ) as nvarchar) 
end ,
case when SUM( pedidos.freight ) is null 
     then CAST('Sin dinero'as VARCHAR) 
	 else cast(SUM( pedidos.freight ) as nvarchar) 
end
from employees empleado 
left outer join orders pedidos 
on empleado.employeeid=pedidos.employeeid
group by empleado.lastname,pedidos.employeeid

-- 6. Crear una consulta que muestre el nombre de empleado, 
-- el número de pedidos tramitado por cada empleado, de aquellos empleados que han tramitado mas de 15 pedidos.

select empleado.lastname,case when COUNT( pedidos.employeeid) > 15 then COUNT( pedidos.employeeid) end
from employees empleado 
inner join orders pedidos 
on empleado.employeeID=pedidos.employeeID
group by empleado.lastname

-- 7. Crear una consulta que muestre el nombre del cliente, 
-- el número de pedidos que nos ha realizado el cliente, el dinero que nos ha dejado en la empresa, de todos los clientes que sean de USA y que nos han realizado mas de 5 pedidos.

select cliente.contactname, count(pedidos.customerid) ,SUM( pedidos.freight)
from customers cliente 
inner join orders pedidos 
on cliente.customerid=pedidos.customerid
where country = 'usa'
group by cliente.contactname

-- 8. Crear una consulta que muestre el nombre del jefe 
-- y el número de empleados a su cargo de aquel jefe que mas empleados tenga a su cargo.

select top 1 jefe.lastname,COUNT( empleado.lastname) as 'numEmp'
from employees jefe 
inner join employees empleado 
on jefe.employeeID=empleado.reportsto
group by jefe.lastname
ORDER BY numEmp desc

-- 9. Obtener el nombre del cliente y el número de pedidos del cliente 
-- que mas pedidos ha realizado en la empresa.

select top 1 cliente.contactname, count( pedidos.customerid )as 'numpedidos'
from customers cliente 
inner join orders pedidos 
on cliente.customerID=pedidos.CustomerID
group by cliente.contactname
order by numpedidos desc

-- 10. Obtener el nombre del cliente y el volumen de negocio del cliente 
-- que mas volumen de negocio nos ha dejado en la empresa.

select top 1 cliente.contactname,SUM ( pedidos.freight ) as 'dinero'
from customers cliente 
inner join orders pedidos 
on cliente.customerID=pedidos.CustomerID
group by cliente.contactname,pedidos.freight
order by dinero desc