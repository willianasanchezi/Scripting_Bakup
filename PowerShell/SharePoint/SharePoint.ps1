# https://docs.microsoft.com/es-es/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps
# https://docs.microsoft.com/es-es/powershell/module/sharepoint-pnp/get-pnplist?view=sharepoint-ps
# https://www.c-sharpcorner.com/blogs/retrieve-sharepoint-list-items-using-pnp-powershell

Clear-Host
$usuario = "cgarciav@mintic.gov.co";
$pwd = "Gaba09478661";
$pwd = ConvertTo-SecureString $pwd -AsPlainText -Force;
$credenciales = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $usuario,$pwd;
# Connect-PnPOnline –Url https://mintic.sharepoint.com –Credentials (Get-Credential)
Connect-PnPOnline –Url https://mintic.sharepoint.com/AP –Credentials ($credenciales)
#Get-PnPField -List "Lists/ListaCumpleanosGeneral"
#Get-PnPListItem -List "Lists/ListaCumpleanosGeneral"
function leerlista(){
    $listItems= (Get-PnPListItem -List "Lists/ListaCumpleanosGeneral" -Fields "Nombre1","Apellido")  
    foreach($listItem in $listItems){  
   Write-Host "Nombre" : $listItem["Nombre1"]  
   Write-Host "Apellido" : $listItem["Apellido"]  
   Write-Host "---------------------------"  
}
}
leerlista


<#######----------------------------###########>

# https://docs.microsoft.com/en-us/powershell/module/sharepoint-online/get-spositescriptfromlist?view=sharepoint-ps
# https://docs.microsoft.com/es-es/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps
# https://www.powershellgallery.com/

Import-Module Microsoft.SharePoint.PowerShell
Import-Module Microsoft.Online.SharePoint.PowerShell
Import-Module SharePointPnPPowerShellOnline

Connect-PnPOnline –Url https://mintic.sharepoint.com –Credentials (Get-Credential)
Get-Command -Module *PnP*

#

Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | select Name,Version

# Conexion con credenciales digitadas  
Import-Module Microsoft.Online.SharePoint.PowerShell
$credential = 'cgarciav@mintic.gov.co'  
Connect-SPOService -Url https://mintic-admin.sharepoint.com -credential $credential  
Get-SPOSite


# Conexion con credenciales emdebidas
Clear-Host
$login = "cgarciav@mintic.gov.co";
$pwd = "Gaba09478661";
$pwd = ConvertTo-SecureString $pwd -AsPlainText -Force;
$credentials = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $login,$pwd;
Connect-SPOService -url https://mintic-admin.sharepoint.com -Credential $credentials;
# Get-SPOSite
Get-SPOSiteScriptFromList -ListUrl "https://mintic.sharepoint.com/AP/Lists/ListaCumpleanosGeneral/AllItems.aspx"


####################
#### Referencia ####
####################

# Conexion con credenciales emdebidas
Clear-Host
$login = "cgarciav@mintic.gov.co";
$pwd = "Gaba09478661";
$pwd = ConvertTo-SecureString $pwd -AsPlainText -Force;
$credentials = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $login,$pwd;
Connect-SPOService -url https://mintic-admin.sharepoint.com -Credential $credentials;
# Get-SPOSite
Get-SPOSiteScriptFromList -ListUrl "https://mintic.sharepoint.com/AP/Lists/ListaCumpleanosGeneral/AllItems.aspx"
# $extracted = Get-SPOSiteScriptFromList -ListUrl "https://mintic.sharepoint.com/AP/Lists/ListaCumpleanosGeneral/AllItems.aspx"
 