DECLARE @c INT;
SET @c = 0;
WHILE @c < 100
  BEGIN
     SELECT @c;
	 SET @c = @c  + 5;
  END;
GO

DECLARE @c2 INT;
SET @c2 = 1;
WHILE @c2 <= 100
  BEGIN
   IF @c2 % 2 = 0
      BEGIN
	    SELECT @c2 AS [Número], 'Par';
	  END 
   ELSE 
     BEGIN
	   SELECT @c2 AS [Número], 'ImPar';
	 END
   SET @c2 = @c2  + 1;
  END

  