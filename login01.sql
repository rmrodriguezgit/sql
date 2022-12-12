 
-- https://blog.buhoos.com/sql-server-como-crear-un-campo-contrasena-o-password/?msclkid=fc13f99bceef11ec8cd3965cb206c972







CREATE DATABASE Sistema;
GO
use Sistema;
GO
CREATE TABLE login (
   idLogin int IDENTITY(1,1) PRIMARY KEY,
   idUsuario varchar(255) NOT NULL,
   pass varbinary(max) NOT NULL
);
GO
-- No funciona por el tipo de dato
INSERT INTO login (idUsuario, pass) 
VALUES ('kasandra',PWDENCRYPT('1234'))

select *
from LOGIN

CREATE PROCEDURE sign_in 
  @user varchar(255),
  @pass varchar(255)
AS
  INSERT INTO login 
     (idUsuario, pass)  
  VALUES (@user, PWDENCRYPT(@pass));


CREATE PROCEDURE log_in 
  @user varchar(255),
  @pass varchar(255),
  @access int OUTPUT
AS
  SELECT @access = PWDCOMPARE(@pass,pass)
  FROM login
  WHERE idUsuario = @user and 
        PWDCOMPARE(@pass,pass)=1;

EXEC sign_in 'user3','1234'

DECLARE @ingreso INT
EXEC log_in 'kasandra','1234', @ingreso OUTPUT
SELECT @ingreso 








