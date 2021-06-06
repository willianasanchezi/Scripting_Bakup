Clear-Host
$nombre1 = "Willian"
$nombre2 = "Antonio"
$apellido1 = "Sanchez"
$apellido2 = "Ibañez"

function crearUsuario(){
    Write-Host "Creando usuario: " $username
    Start-Sleep -Seconds 5
    $password = "Willian12345" | ConvertTo-SecureString -AsPlainText -Force
    New-ADUser -Name $username -GivenName $nombre1 -Surname $apellido1 -SamAccountName $username -Path "OU=Usuarios,OU=AITSOporte,DC=AITSoporte,DC=Local" -AccountPassword $Password -ChangePasswordAtLogon $False -Enabled $True -DisplayName ""
    Start-Sleep -Seconds 5
        $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
        if (!$usuario) { 
            Write-Host "No se creo el usuario: " $username
            Start-Sleep -Seconds 5
        } 
        else
        {
            Write-Host "Se creo el usuario: " $username 
            Start-Sleep -Seconds 5
        }
    break
}

function segundoNombre(){
for($i = 1;$i -le $nombre1.Length;$i++)
    {
    $letra = $nombre2.Substring(0,$i)
    #Write-Host $letra   
    $username = $nombre1 + $letra + $apellido1
    $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
        if (!$usuario) { 
            Write-Host "No existe usuario: " $username
            crearUsuario $username
            Start-Sleep -Seconds 5
            } 
        else
            {
            Write-Host "Existe usuario: " $username
            Start-Sleep -Seconds 5
            }
    }
}

function primerNombre(){
for($i = 1;$i -le $nombre1.Length;$i++)
    {
    $letra = $nombre1.Substring(0,$i)
    #Write-Host $letra   
    $username = $letra + $apellido1
    $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
        if (!$usuario) { 
            Write-Host "No existe el usuario: " $username
            crearUsuario $username $nombre1 $apellido1
            Start-Sleep -Seconds 5
            } 
        else
            {
            Write-Host "Existe el usuario: " $username
            Start-Sleep -Seconds 5
            }
    }

}
primerNombre
