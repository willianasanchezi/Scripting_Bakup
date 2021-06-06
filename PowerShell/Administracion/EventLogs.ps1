Clear-Host
$fecha1 = Get-Date "09/04/2018 7:00:00 a. m."
$fecha2 = Get-Date "09/04/2018 9:00:00 a. m."
Get-EventLog -LogName "Application" -After $fecha1 -Before $fecha2 -EntryType "Error" | Format-List
# $fecha1 = Get-Date 02/04/18
# $fecha2 = Get-Date 03/04/18
# $fecha1 = Get-Date "02/04/2018 3:00:00 p. m."
# $fecha2 = Get-Date "02/04/2018 4:00:00 p. m."
