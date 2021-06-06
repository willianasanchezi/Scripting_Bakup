clear
#$app = Get-WmiObject Win32_Product -ComputerName "DESKTOP-MUGMMAN" | where { $_.name -eq "PSeInt" }
$app = Get-WmiObject Win32_Product -ComputerName "DESKTOP-MUGMMAN" | where { $_.name -eq "Microsoft Visio Professional 2013" }
$app.Uninstall()