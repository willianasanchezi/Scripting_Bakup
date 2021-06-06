<#
Diagnostico
Solucion de problemas sincronizacion contraseñas
https://docs.microsoft.com/es-es/azure/active-directory/hybrid/tshoot-connect-password-hash-synchronization
#>

# No se sincronizan las contraseñas: solución de problemas mediante el cmdlet de diagnóstico
Set-ExecutionPolicy RemoteSigned o Set-ExecutionPolicy Unrestricted.
Import-Module ADSyncDiagnostics
Invoke-ADSyncDiagnostics -PasswordSync

# Un objeto no sincroniza contraseñas: solución de problemas mediante el cmdlet de diagnóstico
Set-ExecutionPolicy RemoteSigned o Set-ExecutionPolicy Unrestricted
Import-Module ADSyncDiagnostics
Invoke-ADSyncDiagnostics -PasswordSync -ADConnectorName "<Name-of-AD-Connector>" -DistinguishedName "<DistinguishedName-of-AD-object>"
<# Ejemplo
Invoke-ADSyncDiagnostics -PasswordSync -ADConnectorName "contoso.com" -DistinguishedName "CN=TestUserCN=Users,DC=contoso,DC=com"
#>