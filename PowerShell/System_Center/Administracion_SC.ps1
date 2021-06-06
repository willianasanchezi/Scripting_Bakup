# Servicio ConfigMgr
get-service -Name CcmExec
# Servicio OpsMgr
get-service -Name HealthService
<# 
Servicios SCSM
Running  OMCFG System Center Management Configuration
Running  OMSDK System Center Data Access Service
#>
get-service -Name OMCFG
get-service -Name OMSDK

# OpsMgr
Get-Service | Where-Object name -eq HealthService
Set-Location 'C:\Program Files\Microsoft Monitoring Agent\Agent\'
Stop-Service HealthService
Remove-Item -Recurse -Force C:\Program Files\Microsoft Monitoring Agent\Agent\Health Service State\
Start-Service HealthService
#
