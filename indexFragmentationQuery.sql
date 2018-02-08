use AddressBook;

SELECT DB_NAME(PS.[database_id]) AS Databasename, OBJECT_NAME(PS.[object_id]) AS TableOrViewName, SI.[name] AS IndexName,
   PS.[index_type_desc] AS IndexType, PS.[avg_fragmentation_in_percent] as AmountOfFragmentation
FROM sys.dm_db_index_physical_stats(DB_ID(N'AddressBook'), NULL, NULL, NULL, 'DETAILED') PS
   inner join sys.indexes si on PS.[object_id] = si.[object_id] AND PS.[index_id] = si.[index_id]
ORDER BY OBJECT_NAME(PS.[object_id]) ASC;
