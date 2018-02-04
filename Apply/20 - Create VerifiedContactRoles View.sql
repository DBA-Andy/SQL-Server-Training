USE AddressBook;

IF EXISTS(SELECT 1 FROM sys.views WHERE [Name] = 'VerifiedContactRoles')
BEGIN
   DROP VIEW dbo.VerifiedContactRoles;
END;

GO

CREATE VIEW dbo.VerifiedContactRoles
WITH SCHEMABINDING
as
SELECT VC.ContactID, VC.FirstName, VC.LastName, VC.DateOfBirth, VC.AllowContactByPhone, VC.DrivingLicenseNumber,
   VC.PassportNumber, R.RoleTitle 
FROM dbo.VerifiedContacts VC
   INNER JOIN dbo.ContactRoles CR on VC.ContactID = CR.ContactID
   INNER JOIN dbo.Roles R on CR.RoleID = R.RoleID;

GO