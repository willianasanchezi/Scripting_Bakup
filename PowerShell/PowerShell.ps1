Export-VM -Name SRVLINUX01 -Path G:\Backup
Get-VMhost
Get-Command -Module Hyper-V
Get-VM -Name SRVLINUX01
vm
Test-Connection -ComputerName SRV12HY02
hostname
ipconfig
# Listado de programas instalados
Get-WmiObject -Class Win32_Product
Get-WmiObject -Query {select name from win32_product where name like "%google%"}
Get-WmiObject -Class Win32_Product -Filter "Name = 'Google Earth Pro'"
#Desistalar
$programa = Get-WmiObject -Class Win32_Product -Filter "Name = 'Google Earth Pro'"
$programa.Uninstall()
Get-Process




