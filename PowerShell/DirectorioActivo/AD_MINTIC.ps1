#Clear-Host
Import-Module ActiveDirectory

Remove-Item E:\SMFiles\Years\*.*
Get-Item E:\SMFiles\Years\

$dia = Get-Date -Format "dd"
$mes = Get-Date -Format "MM"
$fecha = $mes + "/" + $dia
Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,dateOfBirth | where-object {$_.dateOfBirth -like "*$fecha*" } | Export-Csv E:\SMFiles\Years\Usuarios.csv -Encoding UTF8
Get-Item E:\SMFiles\Years\*
<# Inicio Extraer usuarios #>

<# Inicio Formatear informacion #>
$antiguo = '"'
$nuevo = ''
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo

$rutaArchivo = "E:\SMFiles\Years\Usuarios.csv"
$antiguo = "enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth"
$nuevo = "false,Test,Test,Test,wsanchez@coem.co,''"
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 

$antiguo = "#TYPE Selected.Microsoft.ActiveDirectory.Management.ADUser"
$nuevo = "enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth"
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 


Get-Content $rutaArchivo | Set-Content -Encoding utf8 E:\SMFiles\Years\UsuariosUTF8.csv
Get-Item E:\SMFiles\Years\*

<# Fin Formatear informacion #>


<#
$rutaArchivoUTF8 = "E:\SMFiles\Years\UsuariosUTF8.csv"
#>



<## Inicia Codigo para pegar en C# #>

Remove-Item E:\SMFiles\Years\*.*
Get-Item E:\SMFiles\Years\
$dia = Get-Date -Format "dd"
$mes = Get-Date -Format "MM"
$fecha = $mes + "/" + $dia
Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,dateOfBirth | where-object {$_.dateOfBirth -like "*$fecha*" } | Export-Csv E:\SMFiles\Years\Usuarios.csv -Encoding UTF8
Get-Item E:\SMFiles\Years\*
$antiguo = '"'
$nuevo = ''
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo
$rutaArchivo = "E:\SMFiles\Years\Usuarios.csv"
$antiguo = "enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth"
$nuevo = "false,Test,Test,Test,wsanchez@coem.co,''"
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 
$antiguo = "#TYPE Selected.Microsoft.ActiveDirectory.Management.ADUser"
$nuevo = "enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth"
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 
Get-Content $rutaArchivo | Set-Content -Encoding utf8 E:\SMFiles\Years\UsuariosUTF8.csv

<## Finaliza Codigo para pegar en C# #>



<# Inicia export AD actualizar #>
Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" } | Export-Csv E:\SMFiles\AD\Usuarios.csv -Encoding UTF8
<# Finaliza export AD actualizar #>
