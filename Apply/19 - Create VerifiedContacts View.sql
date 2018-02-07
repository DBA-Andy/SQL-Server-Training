USE AddressBook;

IF EXISTS (select 1 from sys.views where [Name] = 'VerifiedContacts')
BEGIN
   DROP VIEW dbo.VerifiedContacts;
END;

GO

CREATE VIEW dbo.VerifiedContacts
WITH SCHEMABINDING
AS
SELECT C.ContactID, C.FirstName, C.LastName, C.DateOfBirth, 
CASE C.AllowContactByPhone 
   WHEN 1 THEN 'Yes'
   ELSE 'No'
END
AS AllowContactbyPhone, CVD.DrivingLicenseNumber, CVD.PassportNumber
FROM dbo.Contacts C
   INNER JOIN dbo.ContactVerificationDetails CVD
      ON c.ContactId = CVD.ContactID
WHERE CVD.ContactVerified = 1;

GO