Get-WindowsFeature -Name NET-WCF-HTTP-Activation45 | 
Add-WindowsFeature -Restart:$false -Verbose -Source 'Windows Update'
Get-Service -Name WsusService | Restart-Service -Verbose
dir 'C:\Program Files\Update Services\WebServices\ClientWebService\Web.Config' | 
Copy-Item -Destination E:\KB3159706\web.config
robocopy E:\KB3159706 "C:\Program Files\Update Services\WebServices\ClientWebService" web.config /R:0 /B

Get-Service -Name WsusService | Restart-Service -Verbose
& "C:\Program Files\Update Services\Tools\wsusutil.exe" checkhealth

Get-winevent -FilterHashtable @{ 
 LogName = 'Application' ; 
 ProviderName = 'Windows Server Update Services'
} -MaxEvents 10

icacls "C:\Program Files\Update Services\WebServices\ClientWebService"
