# https://blogs.technet.microsoft.com/heyscriptingguy/2014/08/05/use-powershell-to-force-office-365-online-users-to-change-passwords/
# https://docs.microsoft.com/en-us/powershell/module/msonline/set-msoluserpassword?view=azureadps-1.0
# https://www.michev.info/Blog/Post/1419/force-password-change-for-all-users-in-office-365

Get-Credential "admin@ScriptingGuy.OnMicrosoft.Com" | Export-Clixml C:\fso\ScriptingGuyCredential.xml
$cred = Import-Clixml C:\fso\ScriptingGuyCredential.xml
Connect-MsolService -Credential $cred

$users = Import-Csv C:\fso\Office365Users.CSV
$users |
   foreach {
     # Forza cambio de clave al acceder al portal O365   
       Set-MsolUserPassword -UserPrincipalName $_.userPrincipalName -ForceChangePasswordOnly $true -ForceChangePassword $true
     # Este comando forza el cambio de clave, pero genera una clave en la consola que se debe suministrar al usuario
     # Set-MsolUserPassword -UserPrincipalName $_.userPrincipalName -ForceChangePassword:$true

     # No lo recomiendo molesta para la creacion de la nueva clave
     # Set-MsolUser -UserPrincipalName $_.userprincipalname -StrongPasswordRequired:$true
     }

     
<#---------------------------------------------#>

Set-MsolUserPassword -UserPrincipalName wsanchez@mintic.gov.co -ForceChangePasswordOnly $true -ForceChangePassword $true
