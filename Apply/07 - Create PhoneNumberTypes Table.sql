USE AddressBook;

IF EXISTS (SELECT 'X' FROM sys.tables where [NAME] = 'PhoneNumberTypes')
BEGIN
   DROP TABLE PhoneNumberTypes;
END;

CREATE TABLE PhoneNumberTypes
(
   PhoneNumberTypeID TINYINT IDENTITY(1,1),
   PhoneNumberType VARCHAR(40),
   CONSTRAINT PK_PhoneNumberTypes PRIMARY KEY CLUSTERED(PhoneNumberTypeID)
);