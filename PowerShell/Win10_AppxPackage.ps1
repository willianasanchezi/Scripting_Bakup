Get-AppxPackage *photos* | Remove-AppxPackage
Get-AppxPackage -allusers | Select Name, PackageFullName | Out-GridView
<#
Microsoft.Windows.Photos	Microsoft.Windows.Photos_16.325.12390.0_x64__8wekyb3d8bbwe	
Microsoft.Windows.Photos	Microsoft.Windows.Photos_16.722.10060.0_x64__8wekyb3d8bbwe	
Microsoft.Windows.Photos	Microsoft.Windows.Photos_16.1118.10000.0_x64__8wekyb3d8bbwe	
#>
Add-AppxPackage -register "C:\Program Files\WindowsApps\Microsoft.Windows.Photos_16.325.12390.0_x64__8wekyb3d8bbwe\appxmanifest.xml" -DisableDevelopmentMode
Add-AppxPackage -register "C:\Program Files\WindowsApps\Microsoft.Windows.Photos_16.722.10060.0_x64__8wekyb3d8bbwe\appxmanifest.xml" -DisableDevelopmentMode
Add-AppxPackage -register "C:\Program Files\WindowsApps\Microsoft.Windows.Photos_16.1118.10000.0_x64__8wekyb3d8bbwe\appxmanifest.xml" -DisableDevelopmentMode