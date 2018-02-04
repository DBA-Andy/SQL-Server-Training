USE AddressBook;

IF EXISTS (SElect 1 from sys.indexes where [Name] = 'IX_NC_PhoneNumberTypes_PhoneNumberType')
BEGIN
   DROP INDEX IX_NC_PhoneNumberTypes_PhoneNumberType on dbo.PhoneNumberTypes;
END;

CREATE INDEX IX_NC_PhoneNumberTypes_PhoneNumberType on dbo.PhoneNumberTypes(PhoneNumberType);

GO