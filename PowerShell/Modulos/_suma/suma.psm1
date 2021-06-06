function suma{
    Param([int]$num1, [int]$num2)
    $suma = $num1 + $num2
    Write-Output "la suma es: " $suma
}
$saludo = "hola"

New-Alias isaw Get-ChildItem
Export-ModuleMember -Function suma -Alias isaw -Variable saludo

# Get-Module
<#
$env:PSModulePath
C:\Users\Administrador\Documents\WindowsPowerShell\Modules;
C:\Program Files\WindowsPowerShell\Modules;
C:\Windows\system32\WindowsPowerShell\v1.0\Modules;
D:\Program Files\Microsoft Azure AD Sync\Bin\;
C:\Program Files\Microsoft Azure AD Connect Health Sync Agent\PowerShell\
#>