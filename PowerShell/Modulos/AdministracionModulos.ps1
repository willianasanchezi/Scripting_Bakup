<#
https://docs.microsoft.com/es-es/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-7.1
#>
# Modulos en ejecuccion
Get-Module
# Listado Modulos
Get-Module -ListAvailable
# Modulo especifico
Get-Module -ListAvailable | Where-Object {$_.Name -like "*escri*"}
# Comandos de un modulo
Get-Command -Module dism

PS C:\Users\Administrador> Get-Command -Module windowsupdate

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-WindowsUpdateLog                               1.0.0.0    windowsupdate

# 

# Manifiesto, REVISAR NO ME FUNCIONO
New-ModuleManifest -Path C:\Windows\System32\WindowsPowerShell\v1.0\Modules\EjemplosPS\EjemplosPS.psd1 -ModuleVersion "1.0" -Author "Willian Sanchez"