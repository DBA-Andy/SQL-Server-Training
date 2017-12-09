USE AddressBook;

IF EXISTS (SELECT 'X' FROM sys.tables where [Name] = 'ContactPhoneNumbers')
BEGIN
   DROP TABLE ContactPhoneNumbers;
END;

CREATE TABLE ContactPhoneNumbers
(
   PhoneNumberID INT IDENTITY(1,1) NOT NULL,
   ContactID INT NOT NULL,
   PhoneNumberTypeID TINYINT NOT NULL,
   PhoneNumber VARCHAR(30) NOT NULL,
   CONSTRAINT PK_ContactPhoneNumbers PRIMARY KEY CLUSTERED (PhoneNumberID)
);

ALTER TABLE ContactPhoneNumbers
ADD CONSTRAINT FK_ContactPhoneNumbers_Contacts
FOREIGN KEY (ContactID)
REFERENCES dbo.Contacts (ContactID)
ON UPDATE NO ACTION
ON DELETE CASCADE;

ALTER TABLE ContactPhoneNumbers
ADD CONSTRAINT FK_ContactPhoneNumbers_PhoneNumberTypes
FOREIGN KEY (PhoneNumberTypeID)
REFERENCES dbo.PhoneNumberTypes (PhoneNumberTypeID)
ON UPDATE NO ACTION
ON DELETE CASCADE;