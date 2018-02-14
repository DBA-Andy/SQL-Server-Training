USE AddressBook;

GO

IF EXISTS (SELECT 1 FROM sys.objects where [name] = 'ContactName' and [type] = 'FN')
BEGIN
   drop function dbo.contactName;
END;

go

CREATE FUNCTION dbo.ContactName
(@FirstName VARCHAR(40), @LastName VARCHAR(40))
RETURNS VARCHAR(80)
AS 
BEGIN

DECLARE @FullName VARCHAR(80);

--Replace null values with empty strings
SELECT @FirstName = COALESCE(@FirstName,''),
   @LastName = COALESCE(@LastName,'');

--Capitalize the first letter of the first name and last name.
SELECT @FirstName = 
   CASE WHEN len(@FirstName) > 0 THEN UPPER(LEFT(@FirstName,1)) + RIGHT(@FirstName, LEN(@FirstName) - 1) ELSE @FirstName END,
   @LastName = CASE WHEN len(@LastName) > 0 THEN UPPER(LEFT(@LastName,1)) + RIGHT(@Lastname, LEN(@LastName) - 1) ELSE @LastName END;

SELECT @FullName = @FirstName + ' ' + @LastName;

RETURN @FullName;

END;

GO