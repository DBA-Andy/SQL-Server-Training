USE master;

if not exists (select 1 from sys.databases where [name] = 'AddressBook')
   BEGIN
      CREATE DATABASE AddressBook
      ON PRIMARY
      (
         NAME = 'AddressBook',
         FILENAME = 'c:\sql_basics\AddressBook.mdf',
         SIZE = 10MB,
         MAXSIZE = UNLIMITED,
         FILEGROWTH = 50%
      )
      LOG ON 
      (
         NAME = 'AddressBook_Log',
         FILENAME = 'c:\sql_basics\AddressBook_Log.ldf',
         SIZE = 2MB,
         MAXSIZE = 100MB,
         FILEGROWTH = 2MB
      );
   END;
GO