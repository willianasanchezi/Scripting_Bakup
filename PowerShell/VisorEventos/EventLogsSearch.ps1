Clear-Host
##
$fecha1 = Get-Date "11/17/2020 7:00:00 AM"
$fecha2 = Get-Date "11/17/2020 11:00:00 AM"
Get-EventLog -LogName "Application" -After $fecha1 -Before $fecha2 -EntryType "Error" | Format-List
Get-EventLog -LogName "Operations Manager" -After $fecha1 -Before $fecha2 -EntryType "Error" | Format-List

##
Get-WinEvent -Path E:\temp\Balsamo\Logs_BALSAMO_evtx\Application.evtx | where {$_.Id -eq "1309" -and $_.message -like "*error*"}
Get-WinEvent -Path E:\temp\Balsamo\Logs_BALSAMO_evtx\Application.evtx | where {$_.message -like "*error*"} | Format-List
Get-WinEvent -Path E:\temp\Balsamo\Logs_BALSAMO_evtx\Application.evtx | where {$_.Id -eq "1309"}
# E:\temp\Balsamo\Logs_BALSAMO_evtx
# E:\temp\Balsamo\Logs_BALSAMO_cvs


Get-EventLog -LogName "Operations Manager" -After "11/24/2020 7:00:00 AM" -Before "11/24/2020 8:00:00 AM"
Get-EventLog -LogName "Operations Manager" -After "11/24/2020 7:00:00 AM" -Before "11/24/2020 8:00:00 AM" -EntryType "Error" | Format-List
$fecha1 = Get-Date "11/24/2020 7:00:00 AM"
$fecha2 = Get-Date "11/24/2020 8:00:00 AM"
Get-EventLog -LogName "Operations Manager" -After $fecha1 -Before $fecha2

Get-EventLog -LogName "Operations Manager" | Where-Object {$_.EventID -eq 256}
Get-EventLog -LogName "Operations Manager"  -After "03/16/2021 7:00:00 AM" -Before "03/16/2021 8:00:00 AM" -InstanceId 4113 | select -ExpandProperty message
Get-EventLog -LogName "Operations Manager" -After "03/16/2021 7:00:00 AM" -Before "03/16/2021 8:00:00 AM" | Where-Object {$_.EventID -eq 26319} | Format-List
