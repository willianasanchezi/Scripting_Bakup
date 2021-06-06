Get-ADGroupMember "CiresonPortal" -recursive | Select-Object SamAccountName, Name

$grupo = "Operadores_Portal"
Get-ADGroupMember $grupo -recursive | Select-Object SamAccountName, Name | Export-Csv -Path .\$grup.csv -NoTypeInformation
