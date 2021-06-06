<#Ejmeplo#>

<#
http://servidor.dokry.com/comprobar-la-existencia-de-cuentas-de-dominio-con-la-secuencia-de-comandos-de-powershell.html
 function validateUser { param( [string]$username ) # If the username is passed without domain\ 
 if(($username.StartsWith("domain\")) -eq $false) { $user = Get-ADUser -Filter { SamAccountName -eq $username } if (!$user) { return $false } else { return $true } } elseif(($username.StartsWith("domain\")) -eq $true) { $username = ($username.Split("\")[1]) $user = Get-ADUser -Filter { SamAccountName -eq $username } if (!$user) { return $false } else { return $true } } } $userCheck = validateUser -username smith02 if($userCheck -eq $true) { do stuff } else { user doesn't exist }
 #>

<# Validar si existe el usuario #>
Clear-Host
$lista = @("administrador","wsanchez","invitado","usuario","test02")
foreach($username in $lista){ 
    $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
    if (!$usuario) { 
        Write-Host "No existe " $username 
        Start-Sleep -Seconds 5
        #return $username 

    } 
    else{
        Write-Host "Existe " $username
        Start-Sleep -Seconds 5
        #return $true 
    }
}


<# 
Creacion de usuario 
https://activedirectoryfaq.com/2016/04/ad-powershell-basics-new-aduser/
https://adamtheautomator.com/new-aduser/
#>
# New-ADUser -Name "ChewDavid" -OtherAttributes @{'title'="director";'mail'="chewdavid@fabrikam.com"}

Get-ADUser -Identity administrador -Properties * | select *

$nombre1 = "Willian"
$nombre2 = "Antonio"
$apellido1 = "Sanchez"
$apellido2 = "Ibañez"

$nombre1.Length
$nombre2.Length
$apellido1.Length
$apellido2.Length


$logon1 = $nombre1.Substring(0,1)
$logon2 = $apellido1
$logon = $logon1 + $logon2
$logon

$password = "Willian12345" | ConvertTo-SecureString -AsPlainText -Force
New-ADUser -Name wsanchez -GivenName Willian -Surname Sanchez -SamAccountName wsanchez -Path "OU=Usuarios,OU=AITSOporte,DC=AITSoporte,DC=Local" -AccountPassword $Password -ChangePasswordAtLogon $False -Enabled $True -DisplayName ""
