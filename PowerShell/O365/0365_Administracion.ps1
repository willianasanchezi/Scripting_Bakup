

# Delegar permisos en el calendario
Add-MailboxFolderPermission -Identity wsanchez@mintic.gov:\Calendar -User aperalta@mintic.gov.co -AccessRights Editor -SharingPermissionFlags Delegate

# Forzar cambio de contraseña, al acceder al portal de O365
Set-MsolUserPassword -UserPrincipalName wsanchez@mintic.gov.co -ForceChangePasswordOnly $true -ForceChangePassword $true


