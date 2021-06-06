
Get-ChildItem -Recurse -Filter *.pst
Get-ChildItem C:\Users

# Impresoras
Get-Printer | fl
Get-Printer | Where-Object {$_.Name -like "*"} | select Name
(New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\printerserver\hplaser3")
# Get-ComputerInfo
Hostname
# https://docs.microsoft.com/en-us/powershell/module/nettcpip/get-netipaddress?view=win10-ps
Get-NetIPAddress

Get-ChildItem -Path Cert:\* -Recurse -CodeSigningCert

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-computer?view=powershell-3.0
Remove-Computer -UnjoinDomaincredential Domain01\Admin01 -Passthru -Verbose -Restart
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/add-computer?view=powershell-3.0
Add-Computer -DomainName Domain01 -Restart
# Tamaño Discos
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-psdrive?view=powershell-6
Get-psdrive –psprovider filesystem
net use
net use /delete F:\

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-psdrive?view=powershell-6
New-PSDrive -Name "S" -Root "\\Server01\Scripts" -Persist -PSProvider "FileSystem"
# Software Instalado
wmic product get name,version
Get-WmiObject -Class Win32_Product | Select-Object -Property Name,Version

# 
Resolve-DnsName -Name www.bing.com


# Get-volume
# dir *.pst /S
