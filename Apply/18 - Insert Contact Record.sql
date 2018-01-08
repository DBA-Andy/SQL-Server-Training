USE AddressBook;

DECLARE @ContactID INT,
@DeveloperRoleID INT,
@MobilePhoneNumberTypeID TINYINT,
@WorkPhoneNumberTypeID TINYINT,
@NumberOfVerificationRecords INT,
@NumberOfContactRoleRecords INT,
@NumberOfContactAddressRecords INT,
@NumberOfContactNoetsRecords INT,
@NumberOfContactPhoneNumberRecords INT;

--Obtain Lookup Values
SELECT @DeveloperRoleID = RoleID FROM dbo.Roles WHERE RoleTitle = 'Developer';
SELECT @MobilePhoneNumberTypeID = PhoneNumberTypeID FROM dbo.PhoneNumberTypes WHERE PhoneNumberType = 'Mobile';
SELECT @WorkPhoneNumberTypeID = PhoneNumberTypeID FROM dbo.PhoneNumberTypes WHERE PhoneNumberType = 'Work';

PRINT 'Developer Role ID: ' + CAST(@DeveloperRoleID AS VARCHAR(20));
PRINT 'Mobile Phone Number Type ID: ' + CAST(@MobilePhoneNumberTypeID as VARCHAR(20));
PRINT 'Work Phone Number Type ID: ' + CAST(@WorkPhoneNumberTypeID as VARCHAR(20));

IF NOT EXISTS (Select 'X' FROM dbo.Contacts WHERE FirstName = 'Ronald' and LastName = 'Dahl')
   BEGIN
      --Add the Contact Record for Ronald Dahl
      INSERT INTO dbo.Contacts(FirstName, LastName, DateOfBirth) VALUES ('Ronald','Dahl','1916-09-13');
      SELECT @ContactID = @@IDENTITY;

	  --Add The Contact Verification Details
	  INSERT INTO dbo.ContactVerificationDetails(ContactID, DrivingLicenseNumber, ContactVerified)
	  VALUES (@ContactID, '1031', 0);

	  SELECT @NumberOfVerificationRecords = @@ROWCOUNT;

	  --Add Developer Role to Contact
	  IF (@DeveloperRoleID IS NOT NULL)
	  BEGIN
	     INSERT INTO dbo.ContactRoles(ContactID, RoleID)
		 VALUES (@ContactID, @DeveloperRoleID);

		 SELECT @NumberOfContactRoleRecords = @@ROWCOUNT;
	  END;

	  --Add an Address
	  INSERT INTO dbo.ContactAddresses(ContactID, HouseNumber, Street, City, Postcode)
	  VALUES (@ContactID, '200', 'Shaftsbury Avenue', 'Hastings', 'TN38 8EZ');

	  SELECT @NumberOfContactAddressRecords = @@ROWCOUNT;

	  --Add a note
	  INSERT INTO dbo.ContactNotes(ContactID, Notes)
	  VALUES (@ContactID, 'Ronald Dahl is a famous author.  He is best known for books aimed at children, such as the BFG');

	  SELECT @NumberOfContactNoetsRecords = @@ROWCOUNT;

	  --Add Phone Numbers
	  IF (@MobilePhoneNumberTypeID IS NOT NULL AND @WorkPhoneNumberTypeID IS NOT NULL)
	  BEGIN
	     INSERT INTO dbo.ContactPhoneNumbers(ContactID, PhoneNumberTypeID, PhoneNumber)
		 VALUES (@ContactID, @MobilePhoneNumberTypeID, '07100 988 199'),
		 (@ContactID, @WorkPhoneNumberTypeID, '01424 700 700');

		 SELECT @NumberOfContactPhoneNumberRecords = @@ROWCOUNT;
	  END;

	  --Return what we've done.
	  --SELECT @ContactID as ContactID, 
	  --@NumberOfVerificationRecords As NumberofVerificationRecords, 
	  --@NumberOfContactRoleRecords as NumberOfContactRoleRecords, 
	  --@NumberOfContactAddressRecords as NumberOfContactAddressRecords,
	  --@NumberOfContactNoetsRecords as NumberOfContactNotesRecords, 
	  --@NumberOfContactPhoneNumberRecords as NumberOfContactPhoneNumberRecords;
   END;

GO