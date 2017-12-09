USE master;

:setvar path "C:\Users\Administrator\Documents\GitHub\SQL-Server-Training\Apply\"

:setvar currentFile "01 - Create AddressBook Database.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "02 - Create Contacts Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "03 - Create ContactNotes Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "04 - Create Roles Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "05 - Create ContactRoles Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "06 - Create ContactAddresses Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "07 - Create PhoneNumberTypes Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "08 - Create ContactPhoneNumbers Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "09 - Create ContactVerificationDetails Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

PRINT 'All Create scripts successfully executed.';

USE Master;