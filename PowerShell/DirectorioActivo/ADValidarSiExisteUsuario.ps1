# Validar usuario
$username = 'wsanchez'
$usuario = Get-ADUser -Filter { SamAccountName -eq $username } 
 if (!$usuario) { 
    Write-Output "No existe"
    return $false 
    } 
 else{
    Write-Output "Existe"     
    return $true 
    }

##
Clear-Host
$lista = @("administrador","wsanchez","invitado","usuario")
foreach($username in $lista){ 
    $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
    if (!$usuario) { 
        Write-Host "No existe " $username 
        Start-Sleep -Seconds 5
        #return $false 

    } 
    else{
        Write-Host "Existe " $username
        Start-Sleep -Seconds 5
        #return $true 
    }
}

#

$lista = @("administrador","wsanchez","invitado","usuario")
foreach($logon in $lista){ 
    Write-Host $logon 
    Start-Sleep -Seconds 5
}
