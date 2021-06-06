<# Inicia export AD actualizar #>
# %windir%\system32\WindowsPowerShell\v1.0\powershell.exe -noexit -command import-module ActiveDirectory
Get-ADDomainController -Discover -Service "ADWS"
Import-Module ActiveDirectory
Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,physicalDeliveryOfficeName,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" } | Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8
<# Finaliza export AD actualizar #>


postalcode
 userPrincipalName
givenName
Sn
company
physicalDeliveryOfficeName
Manager
Title
employeeID
employeeNumber
accountExpires
St
telephoneNumber
employeeType
dateOfBirth
mobile
thumbnailPhoto
streetAddress
description


<##>
clear
Import-Module ActiveDirectory
# $usuario = Get-ADUser -Identity wsanchez -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,streetAddress,dateOfBirth # | Where-Object { $_.POBox -in "Hombre","Mujer" } #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8
$usuario = @(Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" }) #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8 
$usuario[0].Name 
$usuario[0].PObox
$usuario[0].UserPrincipalName


<##>

clear
Import-Module ActiveDirectory
# $usuario = Get-ADUser -Identity wsanchez -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,streetAddress,dateOfBirth # | Where-Object { $_.POBox -in "Hombre","Mujer" } #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8
$usuario = @(Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" }) #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8 
for ($i = 0; $i -le ($usuario.length - 1); $i += 1) {
  #$myList[$i]
  Write-Host "hola" $i $usuario[$i].company, $usuario[$i].name
  }

<# Version 1 #>
clear
Get-ADDomainController -Discover -Service "ADWS"
Import-Module ActiveDirectory
$usuario = @(Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" }) #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8 
for ($i = 0; $i -le ($usuario.length - 1); $i += 1) {
	$query = "insert into Test02 (Texto01, Texto02) values ( '" + $i + "' , '" + $usuario[$i].name + "');"
	Write-Host $query
	Invoke-Command -ComputerName drosera.mintic.gov.co -ScriptBlock { 
		param ($query)
		Invoke-Sqlcmd -Query $query -ServerInstance "drosera.mintic.gov.co\SCORCH" -Database "AD" 
		} -ArgumentList $query
  }
  
  
<# Version 2 #>
clear
Get-ADDomainController -Discover -Service "ADWS"
Import-Module ActiveDirectory
$usuario = @(Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" }) #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8 
$Count = $usuario.Count
Write-Host "Cantidad de registros a insertar: " $Count
for ($i = 0; $i -le ($usuario.length - 1); $i += 1) {
  Write-Host $i $usuario[$i].company, $usuario[$i].name
  $query = "insert into Test02 (Texto01, Texto02) values ( '" + $i + "' , '" + $usuario[$i].name + "');"
  $falta = $Count -$i
  Write-Host "Faltan insertar: " $falta "registros."
  #Write-Host $query
  Invoke-Command -ComputerName drosera.mintic.gov.co -ScriptBlock { 
    param ($query)
    Invoke-Sqlcmd -Query $query -ServerInstance "drosera.mintic.gov.co\SCORCH" -Database "AD" 
    } -ArgumentList $query
  }
  
<# Version 3 #>
clear
Get-ADDomainController -Discover -Service "ADWS"
Import-Module ActiveDirectory
$usuario = @(Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" }) #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8 
$Count = $usuario.Count
Write-Host "Cantidad de registros a insertar: " $Count
for ($i = 0; $i -le ($usuario.length - 1); $i += 1) {
  Write-Host $i $usuario[$i].name
  $query = "insert into Usuarios_AD (Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,physicalDeliveryOfficeName,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,dateOfBirth) values ('" + $usuario[$i].Name + "','" + $usuario[$i].POBox + "','" + $usuario[$i].UserPrincipalName + "','" + $usuario[$i].postalcode + "','" + $usuario[$i].givenName + "','" + $usuario[$i].Sn + "','" + $usuario[$i].company + "','" + $usuario[$i].physicalDeliveryOfficeName + "','" + $usuario[$i].Manager + "','" + $usuario[$i].Title + "','" + $usuario[$i].employeeID + "','" + $usuario[$i].employeeNumber + "','" + $usuario[$i].accountExpires + "','" + $usuario[$i].St + "','" + $usuario[$i].telephoneNumber + "','" + $usuario[$i].employeeType + "','" + $usuario[$i].mobile + "','" + $usuario[$i].description + "','" + $usuario[$i].dateOfBirth + "');"
  $falta = $Count -$i
  Write-Host "Faltan insertar: " $falta "registros."
  #Write-Host $query
  Invoke-Command -ComputerName drosera.mintic.gov.co -ScriptBlock { 
    param ($query)
    Invoke-Sqlcmd -Query $query -ServerInstance "drosera.mintic.gov.co\SCORCH" -Database "AD" 
    } -ArgumentList $query
  }

<# Version 4 #>
clear
#Get-ADDomainController -Discover -Service "ADWS"
Import-Module ActiveDirectory
$codBloque = Get-Random
$usuario = @(Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,streetAddress,dateOfBirth | Where-Object { $_.POBox -in "Hombre","Mujer" }) #| Export-Csv E:\SMFiles\AD\Usuarios.csv -Delimiter ';' -NoTypeInformation -Encoding UTF8 
$Count = $usuario.Count
Write-Host "Cantidad de registros a insertar: " $Count
for ($i = 0; $i -le ($usuario.length - 1); $i += 1) {
  Write-Host $i $usuario[$i].name
  $query = "insert into Usuarios_AD (CodigoBloque,Name,POBox,UserPrincipalName,postalcode,givenName,Sn,company,physicalDeliveryOfficeName,Manager,Title,employeeID,employeeNumber,accountExpires,St,telephoneNumber,employeeType,mobile,description,streetAddress,dateOfBirth) values ('" + $codBloque + "','" + $usuario[$i].Name + "','" + $usuario[$i].POBox + "','" + $usuario[$i].UserPrincipalName + "','" + $usuario[$i].postalcode + "','" + $usuario[$i].givenName + "','" + $usuario[$i].Sn + "','" + $usuario[$i].company + "','" + $usuario[$i].physicalDeliveryOfficeName + "','" + $usuario[$i].Manager + "','" + $usuario[$i].Title + "','" + $usuario[$i].employeeID + "','" + $usuario[$i].employeeNumber + "','" + $usuario[$i].accountExpires + "','" + $usuario[$i].St + "','" + $usuario[$i].telephoneNumber + "','" + $usuario[$i].employeeType + "','" + $usuario[$i].mobile + "','" + $usuario[$i].description + "','" + $usuario[$i].streetAddress + "','" + $usuario[$i].dateOfBirth + "');"
  $falta = $Count -$i
  Write-Host "Faltan insertar: " $falta "registros."
  #Write-Host $query
  Invoke-Command -ComputerName drosera.mintic.gov.co -ScriptBlock { 
    param ($query)
    Invoke-Sqlcmd -Query $query -ServerInstance "drosera.mintic.gov.co\SCORCH" -Database "AD" 
    } -ArgumentList $query, $codBloque
  }
  
  