USE AddressBook;

IF NOT EXISTS (SELECT 'X' FROM dbo.PhoneNumberTypes where PhoneNumberType = 'Home')
BEGIN
   INSERT INTO dbo.PhoneNumberTypes (PhoneNumberType) VALUES ('Home');
END;

IF NOT EXISTS (SELECT 'X' FROM dbo.PhoneNumberTypes where PhoneNumberType = 'Work')
BEGIN
   INSERT INTO dbo.PhoneNumberTypes (PhoneNumberType)
   SELECT 'Work';
END;

IF NOT EXISTS (SELECT 'X' FROM dbo.PhoneNumberTypes where PhoneNumberType In ('Mobile','Other'))
BEGIN
   INSERT INTO dbo.PhoneNumberTypes (PhoneNumberType) VALUES ('Mobile'),('Other');
END;

GO