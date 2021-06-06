Clear-Host
$fecha1 = Get-Date 26/03/18
$fecha2 = Get-Date 27/03/18
Get-EventLog -LogName "Application" -After $fecha1 -Before $fecha2 -EntryType "Error" | Format-List
