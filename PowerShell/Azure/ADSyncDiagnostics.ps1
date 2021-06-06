<#
Diagnostico
Solucion de problemas sincronizacion contrase�as
https://docs.microsoft.com/es-es/azure/active-directory/hybrid/tshoot-connect-password-hash-synchronization
#>

# No se sincronizan las contrase�as: soluci�n de problemas mediante el cmdlet de diagn�stico
Set-ExecutionPolicy RemoteSigned o Set-ExecutionPolicy Unrestricted.
Import-Module ADSyncDiagnostics
Invoke-ADSyncDiagnostics -PasswordSync

# Un objeto no sincroniza contrase�as: soluci�n de problemas mediante el cmdlet de diagn�stico
Set-ExecutionPolicy RemoteSigned o Set-ExecutionPolicy Unrestricted
Import-Module ADSyncDiagnostics
Invoke-ADSyncDiagnostics -PasswordSync -ADConnectorName "<Name-of-AD-Connector>" -DistinguishedName "<DistinguishedName-of-AD-object>"
<# Ejemplo
Invoke-ADSyncDiagnostics -PasswordSync -ADConnectorName "contoso.com" -DistinguishedName "CN=TestUserCN=Users,DC=contoso,DC=com"
#>