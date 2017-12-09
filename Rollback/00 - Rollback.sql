USE master;

:setvar path "C:\Users\Administrator\Documents\GitHub\SQL-Server-Training\Rollback\"

:setvar currentFile "09 - Rollback ContactVerificationDetails Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "08 - Rollback ContactPhoneNumbers Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "07 - Rollback PhoneNumberTypes Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "06 - Rollback ContactAddresses Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "05 - Rollback ContactRoles Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "04 - Rollback Roles Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "03 - Rollback ContactNotes Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "02 - Rollback Contacts Table.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

:setvar currentFile "01 - Rollback AddressBook Database.sql"
PRINT 'Executing $(path)$(currentFile)';
:r $(path)$(currentFile)

PRINT 'All Rollback scripts successfully executed.';

USE Master;