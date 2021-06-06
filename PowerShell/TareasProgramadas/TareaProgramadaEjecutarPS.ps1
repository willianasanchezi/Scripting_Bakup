https://blog.victorsilva.com.uy/powershell-ejecutar-script-de-manera-programada/
$Action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-File C:\Users\Victor\Script.ps1'
$Trigger =  New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "PowerShell Task" -Description "Tarea programada generada por la consola."