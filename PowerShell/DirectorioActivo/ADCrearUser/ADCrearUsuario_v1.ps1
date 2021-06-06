$nombre1 = "Willian"
$nombre2 = "Antonio"
$apellido1 = "Sanchez"
$apellido2 = "Ibañez"

function primerNombre(){
for($i = 1;$i -le $nombre1.Length;$i++)
    {
    $letra = $nombre1.Substring(0,$i)
    Write-Host $letra   
    }
    return $letra
}
#$numLetraP = primernombre


function segundoNombre(){
for($i = 1;$i -le $nombre2.Length;$i++)
    {
    $letra = $nombre2.Substring(0,$i)
    Write-Host $letra
    }
    return $letra
}
#$numLetraS = segundoNombre


function logon(){
    $logon1 = $nombre1.Substring(0,1)
    $logon2 = $apellido1
    $logon3 = $logon1 + $logon2
    return [string]$logon3
}
logon $nombre1 $apellido1
$username = logon


function ad(){
$usuario = Get-ADUser -Filter { SamAccountName -eq $username }
	while($usuario){
			#clear-host
            $numLetraP = primernombre
			get-date
            
			Start-Sleep -Seconds 300
	}
}
ad $username $nombre1 $apellido1


function crearUsuario(){
    Write-Host "Function CrearUsuario " $username
}



function validar(){
#Clear-Host
    $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
    if (!$usuario) { 
        Write-Host "No existe " $username
        Start-Sleep -Seconds 5
        #return $username 
        crearUsuario $username
    } 
    else{
        Write-Host "Existe " $username
        Start-Sleep -Seconds 5
        #return $true 
        logon $username
        
    }

}
validar $username


