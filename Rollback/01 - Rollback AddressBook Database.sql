Use AddressBook;

IF EXISTS (select 1 from sys.databases where [name] = 'AddressBook')
BEGIN
   USE master;
   DROP DATABASE AddressBook;
END;