Import-Module ActiveDirectory
Get-ADUser –filter {Enabled -eq "True"} -properties * | select-object Name,dateOfBirth,POBox,enabled | Export-Csv -LiteralPath E:\SM\AD\Usuarios.csv


###
$archivo = "E:\SM\AD\Directreports.csv"
$Properties = @('DirectReports')
Get-ADUser oosorio -Properties $Properties | Select @{n='directReports';e={$_.directreports -join '; '}} | Export-Csv archivo -Encoding UTF8

###

####
Write-Host "Processing"
$Properties = @('Name','SamAccountName','Description','Office','telephoneNumber','EmailAddress','DirectReports')
Get-ADUser oosorio -Properties $Properties | Select Name,samaccountname,description,office,telephoneNumber,EmailAddress,@{n='directReports';e={$_.directreports -join '; '}} ## | Export-Csv "ADDump.csv" -NoTypeInformation
Write-Host "Done"
###

####
$Properties = @('DirectReports')
Get-ADUser oosorio -Properties $Properties | Select @{n='directReports';e={$_.directreports -join '; '}} ## | Export-Csv "ADDump.csv" -NoTypeInformation
###