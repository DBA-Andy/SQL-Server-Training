use AddressBook;

IF EXISTS (SELECT 1 from sys.tables where [Name] = 'Contacts')
BEGIN
   DROP TABLE dbo.Contacts;
END;

CREATE TABLE dbo.Contacts
(
   ContactID INT IDENTITY(1,1),
   FirstName VARCHAR(40),
   LastName VARCHAR(40),
   DateOfBirth DATE,
   AllowContactByPhone BIT,
   CreatedDate DATETIME,
   CONSTRAINT PK_Contacts PRIMARY KEY CLUSTERED (ContactID)
);

GO