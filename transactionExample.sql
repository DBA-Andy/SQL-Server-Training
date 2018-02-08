USE AddressBook;

Declare @ContactID INT,
@InsertSuccessful BIT = 0;

BEGIN TRANSACTION;

INSERT INTO dbo.Contacts(FirstName, LastName, DateOfBirth, AllowContactByphone)
VALUES ('Bryan','Ferry','1945-09-26',1);

SELECT @ContactID = SCOPE_IDENTITY();

Print 'Inserted Contact ID: ' + CAST(@ContactID as varchar(10));

--select @ContactID = null;

IF (COALESCE(@ContactID, 0) != 0)
BEGIN
insert into DBO.ContactVerificationDetails(ContactId, DrivingLicenseNumber, ContactVerified)
VALUES (@ContactID, 1032, 1);

SELECT @InsertSuccessful = 1;
END;

IF (@InsertSuccessful = 1)
BEGIN
COMMIT TRANSACTION;
PRINT 'Transaction Committed Successfully.';
END;
ELSE
BEGIN
ROLLBACK TRANSACTION;
PRINT 'Transaction rolled back.  No Changes made.';
END;
