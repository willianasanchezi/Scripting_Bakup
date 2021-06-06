# Script to be run weekly by task scheduler to cleanup IIS log files 
# greater than 30 days old. 
$start = (get-date).AddDays(-90) 
cd c:\inetpub\logs\logfiles\w3svc1 
Get-ChildItem | where {$PSItem.LastWriteTime -lt $start} | Remove-Item

#$start = (get-date).AddDays(-90)
cd c:\inetpub\logs\logfiles\W3SVC1384829780 
Get-ChildItem | where {$PSItem.LastWriteTime -lt $start} | Remove-Item