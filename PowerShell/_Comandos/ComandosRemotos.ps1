Clear-Host
# Agregar usuario en el administrador de credenciales mintic\usr.sccmadm y servidor cardamomo.mintic.gov.co
# para poder ejecutar comandos remotos sin necesidad de utilizar el comando Enter-PSSession 
# Enter-PSSession cardamomo.mintic.gov.co -Credential mintic\usr.sccmadm

<# Tamaño discos #>
Invoke-Command -ComputerName curcuma.mintic.gov.co {Get-Volume}
Invoke-Command -ComputerName curcuma.mintic.gov.co {Get-Volume  | Format-Table DriveLetter, FileSystemLabel, @{n="Size";e={[math]::Round($_.Size/1GB,2)}},@{n="SizeRemaining";e={[math]::Round($_.SizeRemaining/1GB,2)}} }
Invoke-Command -ComputerName (Get-Content E:\Sync\Scripting\PowerShell\1_ComandosRemotos\ServidoresMINTIC.txt) -FilePath E:\Sync\Scripting\PowerShell\1_ComandosRemotos\SizeDisc.ps1
<# Fin Tamaño discos #>

Invoke-Command -ComputerName cardamomo.mintic.gov.co -FilePath E:\Script.ps1
Invoke-Command -ComputerName (Get-Content E:\Sync\Scripting\PowerShell\1_ComandosRemotos\listado.txt) -FilePath E:\Sync\Scripting\PowerShell\1_ComandosRemotos\Script.ps1
Invoke-Command -ComputerName curcuma.mintic.gov.co {Get-EventLog -List}
Invoke-Command -ComputerName curcuma.mintic.gov.co -FilePath E:\Sync\Scripting\PowerShell\1_ComandosRemotos\EventLogs.ps1

<# Visor Eventos #>
$fecha1 = Get-Date 19/02/18
$fecha2 = Get-Date 20/02/18
Get-EventLog -LogName "Application" -After $fecha1 -Before $fecha2 -EntryType "Error" | Format-List
<# Fin Visor Eventos #>
