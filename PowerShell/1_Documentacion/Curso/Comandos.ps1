<#
https://www.youtube.com/watch?v=YwGIXXqLDkM&list=PLn98b7UTDjb1h5_LCHXyeJR8nrPeTaSBM
#>
# Actualizar
Update-Help -Module Microsoft.PowerShell*
# Detalle
Get-Help Get-ChildItem -Detailed
# Comando con ejemplos
Get-Help Get-ChildItem -Examples
# Comandos y ejemplos
Get-Help Get-ChildItem -Full
# Politica de seguridad actual
Get-ExecutionPolicy
# Cambiar politica de seguridad
Set-ExecutionPolicy Unrestricted
# Mostrar en pantalla
Write-Host "Hi"
# Limpiar pantalla
Clear-Host
# Contante
New-Variable -Name texto1 -Value "Hi" -Option ReadOnly
# Tipo de Variable
Write-Host $texto1.GetType().name
# Listado de variables
Get-Variable
# Tipo de Variable
[float] $precio = 5.5
Write-Host $precio
Write-Host $precio.GetType().name

[int] $precio = 5.5
Write-Host $precio
Write-Host $precio.GetType().name

# C
$fecha1 = [datetime] "11/12/2020"
Write-Host $fecha1
Write-Host $fecha1.GetType().Name

[datetime] $fecha2 = "11/12/2020"
Write-Host $fecha2
Write-Host $fecha2.GetType().Name


$a = 4
Write-Host $a
$a = 5
Write-Host $a

<# Notas #>
# Filtros

get-volume
get-volume | Where-Object {$_.DriveLetter -eq "P"}

Get-ADComputer -Filter *

Get-Service | Get-Member
Get-Service | Group-Object -Property Status
Get-Service | Group-Object -Property DisplayName
Get-Service | Select *
Get-Service | Where-Object {$_.Status -eq "Running"}
Get-Service | Where Status -eq "Running"
Get-Service | Where-Object {$_.DisplayName -eq "Windows Time"}
Get-Service | Where-Object name -Like *term*
Get-Service | where Status -eq "Stopped"


