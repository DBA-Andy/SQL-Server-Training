use AddressBook;

IF EXISTS (SELECT 1 from sys.tables where [Name] = 'Contacts')
BEGIN
   DROP TABLE dbo.Contacts;
END;

CREATE TABLE dbo.Contacts
(
   ContactID INT IDENTITY(1,1) NOT NULL,
   FirstName VARCHAR(40) NOT NULL,
   LastName VARCHAR(40) NOT NULL,
   DateOfBirth DATE NULL,
   AllowContactByPhone BIT NOT NULL CONSTRAINT DF_Contacts_AllowContactByPhone DEFAULT 0,
   CreatedDate DATETIME NOT NULL CONSTRAINT DF_Contacts_CreatedDate DEFAULT GetDate(),
   CONSTRAINT PK_Contacts PRIMARY KEY CLUSTERED (ContactID)
);

GO