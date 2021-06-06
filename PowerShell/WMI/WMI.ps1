Get-WmiObject win32_service | Where-Object {$_.Name -eq "dfs"} | select *
Get-WmiObject win32_service | format-list *
Get-WmiObject win32_service | Where-Object {$_.Name -eq "dfs"} | Format-Table name, startname, startmode
Get-WmiObject win32_service | Where-Object {$_.Name -like "*System*"} | Format-Table name, startname, startmode
Get-WmiObject win32_service | Where-Object {$_.displayname -like "*system*"} | Format-Table name, startname, startmode
