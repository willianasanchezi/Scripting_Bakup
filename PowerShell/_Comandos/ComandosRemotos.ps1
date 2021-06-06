Clear-Host
# Agregar usuario en el administrador de credenciales aitsoporte\usr.sccmadm y servidor cardamomo.aitsoporte.local
# para poder ejecutar comandos remotos sin necesidad de utilizar el comando Enter-PSSession 
# Enter-PSSession cardamomo.aitsoporte.local -Credential aitsoporte\usr.sccmadm

<# Tamaño discos #>
Invoke-Command -ComputerName curcuma.aitsoporte.local {Get-Volume}
Invoke-Command -ComputerName curcuma.aitsoporte.local {Get-Volume  | Format-Table DriveLetter, FileSystemLabel, @{n="Size";e={[math]::Round($_.Size/1GB,2)}},@{n="SizeRemaining";e={[math]::Round($_.SizeRemaining/1GB,2)}} }
Invoke-Command -ComputerName (Get-Content E:\Sync\Scripting\PowerShell\1_ComandosRemotos\ServidoresMINTIC.txt) -FilePath E:\Sync\Scripting\PowerShell\1_ComandosRemotos\SizeDisc.ps1
<# Fin Tamaño discos #>

Invoke-Command -ComputerName cardamomo.aitsoporte.local -FilePath E:\Script.ps1
Invoke-Command -ComputerName (Get-Content E:\Sync\Scripting\PowerShell\1_ComandosRemotos\listado.txt) -FilePath E:\Sync\Scripting\PowerShell\1_ComandosRemotos\Script.ps1
Invoke-Command -ComputerName curcuma.aitsoporte.local {Get-EventLog -List}
Invoke-Command -ComputerName curcuma.aitsoporte.local -FilePath E:\Sync\Scripting\PowerShell\1_ComandosRemotos\EventLogs.ps1

<# Visor Eventos #>
$fecha1 = Get-Date 19/02/18
$fecha2 = Get-Date 20/02/18
Get-EventLog -LogName "Application" -After $fecha1 -Before $fecha2 -EntryType "Error" | Format-List
<# Fin Visor Eventos #>
