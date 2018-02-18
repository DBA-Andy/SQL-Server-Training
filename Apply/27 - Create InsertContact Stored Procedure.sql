USE AddressBook;

GO


IF EXISTS (SELECT 1 FROM sys.procedures where [name] = 'InsertContact')
BEGIN
   DROP PROCEDURE InsertContact;
END;

GO

CREATE PROCEDURE dbo.insertContact
(
@FirstName VARCHAR(40),
@LastName VARCHAR(40),
@DateOfBirth DATE,
@AllowContactByphone Bit = 0,
@Notes CONTACTNOTE READONLY,
@ContactID INT = 0 OUTPUT
)
AS
BEGIN

   SET NOCOUNT ON;

   BEGIN TRANSACTION;

     INSERT INTO dbo.Contacts(FirstName, LastName, DateOfBirth, AllowContactByPhone)
	 VALUES (@FirstName, @LastName, @DateofBirth, @AllowContactByPhone);

	 SELECT @ContactID = SCOPE_IDENTITY();

	 PRINT 'Contact ID Inserted: ' + CONVERT(VARCHAR(20), @ContactID);

		INSERT INTO dbo.contactNotes (ContactID, Notes)
		SELECT @ContactID, Note from @Notes;

		SET NOCOUNT OFF;

   COMMIT TRANSACTION;

   SELECT @ContactID as ContactID;

   SET NOCOUNT OFF;
END;

go