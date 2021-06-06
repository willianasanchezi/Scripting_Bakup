# https://blogs.technet.microsoft.com/poshchap/2017/02/10/security-focus-enable-disable-mfa-on-azure-ad-admin-account/

# Habilitar
$St = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
$St.RelyingParty = "*"
$Sta = @($St)
Set-MsolUser -UserPrincipalName ifarr@contoso.com -StrongAuthenticationRequirements $Sta 

# Deshabilitar
$Sta = @()
Set-MsolUser -UserPrincipalName ifarr@contoso.com -StrongAuthenticationRequirements $Sta