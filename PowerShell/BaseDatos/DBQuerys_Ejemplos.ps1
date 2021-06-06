Import-Module F:\Sync\Scripting\PowerShell\BaseDatos\DBModulo.ps1
<#
Invoke-DatabaseQuery –query "DELETE FROM MyTable" –isSQLServer –connectionString "Data Source=SERVER1\SQLEXPRESS;Initial Catalog=MyDatabase;User Id=myLogin;Password=P@ssw0rd"
Get-DatabaseData -verbose -connectionString 'Server=localhost\SQLEXPRESS;Database=Inventory;Trusted_Connection=True;' -isSQLServer-query "SELECT * FROM Computers"
Invoke-DatabaseQuery -verbose -connectionString 'Server=localhost\SQLEXPRESS;Database=Inventory;Trusted_Connection=True;' -isSQLServer-query "INSERT INTO Computers (computer) VALUES('win7')"
Get-DatabaseData -verbose -connectionString 'Server=localhost\SQLEXPRESS;Database=Inventory;Trusted_Connection=True;' -isSQLServer-query "SELECT * FROM Computers"
#>
Get-DatabaseData -verbose -connectionString 'Server=templaurel.aitsoporte.local\SERVICEMANAGER;Database=ServiceManager;Trusted_Connection=True;' -isSQLServer-query "select * from AlertCustomField"
Invoke-DatabaseQuery -verbose -connectionString 'Server=templaurel.aitsoporte.local\SERVICEMANAGER;Database=ServiceManager;Trusted_Connection=True;' -isSQLServer-query "select * from AlertCustomField"