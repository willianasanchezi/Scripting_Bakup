<#
Get-ADUser wsanchez -properties * | more
Get-ADUser -identity wsanchez -properties * | more
Get-ADUser -identity wsanchez -properties dateOfBirth,POBox
Get-ADUser -Filter "Name -like '*Willia*'" -Properties Name,dateOfBirth,POBox

Get-ADUser –filter * -properties *  | select-object Name,dateOfBirth,POBox,enabled 

#>

# Fecha cumpleaños y genero
Clear-Host
Get-ADUser –filter {Enabled -eq "True"} -properties * | select-object Name,dateOfBirth,POBox,enabled | Export-Csv -LiteralPath E:\SM\AD\Usuarios.csv -Encoding UTF8

Get-ADUser –filter {Enabled -eq "True"} -properties * | Select-Object PostalCode,Name,Description,Office,State | Export-Csv -LiteralPath E:\SMFiles\Years\UsuariosAD.csv -Encoding UTF8


$arreglo = Get-ADUser –filter {Enabled -eq "True"} -properties * | Select-Object PostalCode
Set-ADUser -Identity administrator -PostalCode "54321"