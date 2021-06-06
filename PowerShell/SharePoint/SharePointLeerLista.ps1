# https://docs.microsoft.com/es-es/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps
# https://docs.microsoft.com/es-es/powershell/module/sharepoint-pnp/get-pnplist?view=sharepoint-ps
# https://www.c-sharpcorner.com/blogs/retrieve-sharepoint-list-items-using-pnp-powershell

Clear-Host 
$usuario = "cgarciav@mintic.gov.co";
$pwd = "Pok10241";
$pwd = ConvertTo-SecureString $pwd -AsPlainText -Force;
$credenciales = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $usuario,$pwd;
# Connect-PnPOnline “Url https://mintic.sharepoint.com“ Credentials (Get-Credential)
Connect-PnPOnline “Url https://mintic.sharepoint.com/AP“ Credentials ($credenciales)
# Get-PnPField -List "Lists/ListaCumpleanosGeneral"
#Get-PnPListItem -List "Lists/ListaCumpleanosGeneral"
function leerlista(){
    $listItems= (Get-PnPListItem -List "Lists/ListaCumpleanosGeneral" -Fields "Nombre1","Apellido")  
    foreach($listItem in $listItems){  
   Write-Host "---------------------------"  
   Write-Host "Nombre" : $listItem["Nombre1"]  
   Write-Host "Apellido" : $listItem["Apellido"]  
   Write-Host "---------------------------"  
}
}
leerlista