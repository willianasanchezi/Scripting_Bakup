clear
Import-Module OperationsManager
Get-SCOMNotificationSubscription > D:\SCOM\Subscription.txt
Get-SCOMNotificationSubscription | Export-Csv D:\SCOM\Subscription.csv
Get-SCOMNotificationSubscriber | foreach-object {$_.devices | where {$_.protocol -eq "smtp"}} | select name,address
Get-SCOMNotificationSubscriber | foreach-object {$_.devices | where {$_.protocol -eq "smtp"}}