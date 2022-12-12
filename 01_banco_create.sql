CREATE DATABASE banco

USE banco

CREATE TABLE Clientes(
CodigoCliente INT IDENTITY(1,1) PRIMARY KEY, 
Fecha date,
Nombre varchar(100),
Apellido varchar(100),
CURP varchar(20)
)

CREATE TABLE CuentaCliente(
CuentaCliente INT IDENTITY(1,1) PRIMARY KEY, 
CodigoCliente INT FOREIGN KEY REFERENCES Clientes, 
NIP VARCHAR(4),
SALDO Money 
)

CREATE TABLE Operaciones(
ClaveOperaciones INT IDENTITY(1,1) PRIMARY KEY, 
CodigoCliente INT FOREIGN KEY  REFERENCES Clientes, 
NIP VARCHAR(4),
TipoOperacion INT,     -- 1 Consulta, 2 Retiro, 3 Depósito
Fecha date,
Monto Money
)

INSERT INTO Clientes (fecha, Nombre, Apellido, CURP)
VALUES (Getdate(), 'Ruben','Rodriguez','RORR691029hgtdnb01')

SELECT * 
FROM Clientes

INSERT into CuentaCliente (CodigoCliente, NIP, Saldo)
VALUES (1,'1234',0)

SELECT *
FROM CuentaCliente

INSERT into Operaciones (CodigoCliente, NIP, TipoOperacion, fecha, Monto)
VALUES (1,'1235',2,getdate(),10000)

SELECT *
FROM Operaciones

CREATE TRIGGER TR_Operaciones_Cliente
ON Operaciones FOR INSERT
AS
-- Defino las variables que voy a obtener a partir del INSERT
  DECLARE @nipingresado varchar(4)
  DECLARE @cliente int
  DECLARE @monto money
  DECLARE @tipo int -- 1 Tipo Consulta, 2 Retiro, 3 Depósito
  -- Definir las variables del cliente a partir del INSERT
  DECLARE @nip2 varchar(4)
  DECLARE @cliente2 int 
  DECLARE @saldo money
  -- Guardar las variables del registro que se acaba de Insertar
  SELECT @nipingresado = inserted.nip, @cliente = inserted.CodigoCliente, @monto = inserted.Monto,
         @tipo = inserted.TipoOperacion
  FROM inserted
  -- Guardar en las variables la información del cliente que acaba de ser insertado
  SELECT @nip2 = nip, @saldo = saldo, @cliente2 = codigocliente
  FROM CuentaCliente
  WHERE CodigoCliente = @cliente
  -- Validación
  IF (@nipingresado <> @nip2) 
  BEGIN
      ROLLBACK TRANSACTION
	  PRINT 'NIP INCORRECTO'
	  -- RAISERROR ('NIP Incorrecto',16,1)
  End
  ELSE
  BEGIN
     IF (@tipo = 1)  PRINT 'Saldo = '+str(@Saldo)
	 ELSE
	 BEGIN
	   IF (@tipo = 3) 
	   BEGIN
	     UPDATE CuentaCliente 
		 SET CuentaCliente.Saldo = @Saldo + @monto
		 WHERE CodigoCliente = @cliente
	   END 
	   ELSE
	     IF (@tipo = 2 and @monto <= @saldo and @monto<=8000) 
	     BEGIN
	       UPDATE CuentaCliente
		   SET CuentaCliente.Saldo = @Saldo - @monto
		   WHERE CodigoCliente = @cliente
	     END 
	     ELSE 
	     BEGIN
	       ROLLBACK TRANSACTION
		    PRINT 'OPERACIÓN CANCELADA'
	       -- RAISERROR ('Operación Cancelada',16,1)
	     END
	 END 
  END
 GO