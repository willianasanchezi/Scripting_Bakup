Get-ADComputer -Filter *

Get-ADComputer -Filter 'Name -like "DA*"'

Get-ADComputer -Filter "Name -eq '$line'"
Get-ADComputer -Filter "Name -eq 'DASAGH5PD6X'"

#
$variable = "PADICOFKBJU"
Get-ADComputer -Filter "Name -eq '$variable'"
#

# Listado de Usuarios con fecha de creacion de la cuenta
Get-ADUser -Filter * -Properties whencreated | Format-Table -Property name, Enabled, SamAccountName, UserPrincipalName, whencreated

###

# Cambiar Clave
get-aduser -filter * -properties * -searchbase "distinguishedname" | Select Name,SamAccountName | export-csv c:\temp\
Set-ADAccountExpiration -Identity admin_systemcenter -DateTime 1/02/20
