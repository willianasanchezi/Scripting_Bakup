<#
https://docs.microsoft.com/es-es/azure/active-directory/hybrid/tshoot-connect-password-hash-synchronization
Ejecute este script una sola vez. Si tiene que ejecutarlo varias veces, el problema se debe a otro motivo.
https://docs.microsoft.com/es-es/azure/active-directory/hybrid/tshoot-connect-password-hash-synchronization#get-the-status-of-password-sync-settings
#>
$adConnector = "<CASE SENSITIVE AD CONNECTOR NAME>"
$aadConnector = "<CASE SENSITIVE AAD CONNECTOR NAME>"
Import-Module adsync
$c = Get-ADSyncConnector -Name $adConnector
$p = New-Object Microsoft.IdentityManagement.PowerShell.ObjectModel.ConfigurationParameter "Microsoft.Synchronize.ForceFullPasswordSync", String, ConnectorGlobal, $null, $null, $null
$p.Value = 1
$c.GlobalParameters.Remove($p.Name)
$c.GlobalParameters.Add($p)
$c = Add-ADSyncConnector -Connector $c
Set-ADSyncAADPasswordSyncConfiguration -SourceConnector $adConnector -TargetConnector $aadConnector -Enable $false
Set-ADSyncAADPasswordSyncConfiguration -SourceConnector $adConnector -TargetConnector $aadConnector -Enable $true