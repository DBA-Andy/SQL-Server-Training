USE AddressBook;

IF EXISTS (SELECT 1 from sys.objects where [name] = 'ContactCounts' and [Type] = 'TF')
BEGIN
   DROP FUNCTION dbo.ContactCounts;
END;

GO

-- Table valued function to return contact record counts
-- Acceptable values for @TableName are ALL ContactAddresses, ContactNotes, --
-- ContactPhoneNumbers, and ContactRoles
CREATE FUNCTION dbo.ContactCounts
(
@ContactID INT,@TableName VARCHAR(40)
)
RETURNS @CountsTable TABLE (ContactID INT, AddressCount INT, NoteCount INT, PhoneNumberCount INT, RoleCount INT)
AS
BEGIN

-- Variables to hold the counts
DECLARE @AddressCount INT, @NoteCount INT, @PhoneNumberCount INT, @RoleCount INT;

-- Return address count
IF (@TableName IN ('All','ContactAddresses'))
BEGIN
   SELECT @AddressCount = count(1) from dbo.ContactAddresses CA WHERE CA.ContactID = @ContactID;
END;

IF (@TableName in ('All','ContactNotes'))
BEGIN
   SELECT @NoteCount = COUNT(1) from dbo.ContactNotes CN WHERE CN.ContactID = @ContactID;
END;

IF (@TableName in ('All','ContactPhoneNumbers'))
BEGIN
   SELECT @PhoneNumberCount = COUNT(1) from dbo.ContactPhoneNumbers PN WHERE PN.ContactID = @ContactID;
END;

IF (@TableName in ('All','ContactRoles'))
BEGIN
   SELECT @RoleCount = COUNT(1) from dbo.ContactRoles CR where CR.ContactID = @ContactID;
END;

-- If we have at least one valid value, add the row
IF (@AddressCount > 0 or @NoteCount > 0 or @PhoneNumberCount > 0 or @RoleCount > 0)
BEGIN
   INSERT INTO @CountsTable (ContactID, AddressCount, NoteCount, PhoneNumberCount, RoleCount)
   SELECT @ContactID, @AddressCount, @NoteCount, @PhoneNumberCount, @RoleCount;
END;

RETURN;

END;

GO