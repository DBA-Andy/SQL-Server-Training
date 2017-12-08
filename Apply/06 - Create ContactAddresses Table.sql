USE AddressBook;

IF EXISTS (SELECT 'X' from sys.tables where [NAME] = 'ContactAddresses')
BEGIN
   DROP TABLE ContactAddresses;
END;

CREATE TABLE ContactAddresses
(
   AddressID INT IDENTITY (1,1),
   ContactID INT,
   HouseNumber VARCHAR(200),
   Street VARCHAR(200),
   City VARCHAR(200),
   POSTCODE VARCHAR(20),
   CONSTRAINT PK_ContactAddresses PRIMARY KEY NONCLUSTERED (AddressID)
);

ALTER TABLE dbo.ContactAddresses
ADD CONSTRAINT FK_ContactAddresses_Contact 
FOREIGN KEY (ContactID)
REFERENCES dbo.Contacts (ContactID)
ON UPDATE NO ACTION
ON DELETE CASCADE;

GO