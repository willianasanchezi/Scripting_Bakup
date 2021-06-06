
$dia = Get-Date -Format "dd"
$mes = Get-Date -Format "MM"
$fecha = $mes + "/" + $dia
# $fecha = "10/20/"
Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,dateOfBirth | where-object {$_.dateOfBirth -like "*$fecha*" } | Export-Csv C:\Windows\Temp\Usuarios.csv -Encoding UTF8
