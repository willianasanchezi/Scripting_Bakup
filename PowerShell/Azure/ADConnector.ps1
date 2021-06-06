<#
Sincronizacion de Azure AD Connect: comprender y personalizar la sincronizacion
https://docs.microsoft.com/es-es/azure/active-directory/hybrid/how-to-connect-sync-whatis
#>
Invoke-Command -ComputerName azafran {get-service -name *azure*}

Invoke-Command -ComputerName azafran {get-service -name ADSync}
Invoke-Command -ComputerName azafran {get-service -name AzureADConnectHealthSyncInsights}
Invoke-Command -ComputerName azafran {get-service -name AzureADConnectHealthSyncMonitor}

Invoke-Command -ComputerName azafran {Restart-Service -name ADSync}
Invoke-Command -ComputerName azafran {Restart-Service -name AzureADConnectHealthSyncInsights}
Invoke-Command -ComputerName azafran {Restart-Service -name AzureADConnectHealthSyncMonitor}


<#
https://docs.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-adsynctools#install-the-adsynctools-powershell-module
Install the ADSyncTools PowerShell Module
#>

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Import-module -Name "C:\Program Files\Microsoft Azure Active Directory Connect\Tools\AdSyncTools"

Get-module AdSyncTools
