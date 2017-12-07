USE master;

if exists (select 1 from sys.databases where [name] = 'AddressBook')
   BEGIN
      drop database AddressBook;
   END;
GO