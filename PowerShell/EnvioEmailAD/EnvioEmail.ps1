#Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth | Export-Csv C:\Windows\Temp\Usuarios.csv -Encoding UTF8
#Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth | where-object {$_.dateOfBirth -like "*7/05*" }


<#
$proceso = ((get-process excel | select MainWindowTitle, ID, StartTime | Sort StartTime)[-1]).Id
$proceso
Stop-Process -Id $proceso -Force
#>

Clear-Host

Remove-Item E:\SMFiles\Years\*.*
Get-Item E:\SMFiles\Years\

<# Inicio Extraer usuarios 
que en la fecha de cumpleaños esta el dia y mes de hoy
#>
$dia = Get-Date -Format "dd"
$mes = Get-Date -Format "MM"
$fecha = $mes + "/" + $dia
Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,dateOfBirth | where-object {$_.dateOfBirth -like "*$fecha*" } | Export-Csv E:\SMFiles\Years\Usuarios.csv -Encoding UTF8
Get-Item E:\SMFiles\Years\*
<# Inicio Extraer usuarios #>

<# Inicio Formatear informacion #>

$rutaArchivo = "D:\tmp\Usuarios.csv"
$antiguo = '"enabled","Office","Name","POBox","UserPrincipalName","dateOfBirth"'
$nuevo = '"false","Test","Test","Test","wsanchez@coem.co",""'
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 

$antiguo = "#TYPE Selected.Microsoft.ActiveDirectory.Management.ADUser"
$nuevo = '"enabled","Office","Name","POBox","UserPrincipalName","dateOfBirth"'
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 

$antiguo = '"'
$nuevo = ''
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo

Get-Content $rutaArchivo | Set-Content -Encoding utf8 D:\tmp\UsuariosUTF8.csv
Get-Item E:\SMFiles\Years\*
<# Fin Formatear informacion #>


$rutaArchivoUTF8 = "D:\tmp\UsuariosUTF8.csv"
