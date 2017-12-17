USE AddressBook;

DECLARE @ContactID INT,
@NumberOfVerificationRecords INT,
@NumberOfContactRoleRecords INT, 
@NumberOfContactAddressRecords INT,
@NumberOfContactNotesRecords INT,
@NumberOfContactPhoneNumberRecords INT;

IF EXISTS (SELECT 'X' FROM dbo.Contacts where FirstName = 'Ronald' and LastName = 'Dahl')
BEGIN
   --Obtain the Contact ID
   SELECT @ContactID = ContactID FROM dbo.Contacts where FirstName = 'Ronald' and LastName = 'Dahl';

   --Delete SubRecords
   DELETE FROM dbo.ContactVerificationDetails where ContactID = @ContactID;
   SELECT @NumberOfVerificationRecords = @@ROWCOUNT;

   DELETE from dbo.ContactRoles where ContactID = @ContactID;
   SELECT @NumberOfContactRoleRecords = @@ROWCOUNT;

   DELETE FROM dbo.ContactAddresses where ContactID = @ContactID;
   SELECT @NumberOfContactAddressRecords = @@ROWCOUNT;

   DELETE FROM dbo.ContactNotes WHERE ContactID = @ContactID;
   SELECT @NumberOfContactNotesRecords = @@ROWCOUNT;

   DELETE FROM dbo.ContactPhoneNumbers where ContactID = @ContactID;
   SELECT @NumberOfContactPhoneNumberRecords = @@ROWCOUNT;

   --Delete Main Record
   DELETE FROM dbo.Contacts WHERE ContactID = @ContactID;
END;

SELECT @ContactID as DeletedContactID,
   @NumberOfVerificationRecords as NumberOfVerificationRecords,
   @NumberOfContactRoleRecords as NumberOfContactRoleRecords,
   @NumberOfContactAddressRecords as NumberOfContactAddressRecords,
   @NumberOfContactNotesRecords as NumberOfContactNotesRecords,
   @NumberOfContactPhoneNumberRecords as NumberOfContactPhoneNumberRecords;

