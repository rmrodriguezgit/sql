DECLARE @nombreCompleto VARCHAR(65), @longitud INT,
       @Nombre VARCHAR(65), @c INT;
SET @nombreCompleto = 'KARLOS ADRIAN BOBADILLA VALENZUELA';

SET @longitud = LEN(@nombreCompleto);
SET @c = 1;
WHILE @c <= @longitud
  BEGIN
     SELECT SUBSTRING(@nombreCompleto,1,@c);
	 SET @c = @c + 1;
  END