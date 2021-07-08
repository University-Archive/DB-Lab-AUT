CREATE PROCEDURE Q3
@a INT OUTPUT, @b INT OUTPUT
AS
	DECLARE @temp AS INT = @a
	SET @a = @b
	SET @b = @temp
GO

DECLARE @a AS INT = 24
DECLARE @b AS INT = 123
EXEC Q3 
@a = @a OUTPUT,
@b = @b OUTPUT
PRINT @a
PRINT @b