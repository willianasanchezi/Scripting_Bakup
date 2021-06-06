function ad(){
	while($True){
			clear-host
			get-date
            # Inicio While
            $nombre1 = "Willian"
            $nombre2 = "Antonio"
            $apellido1 = "Sanchez"
            $apellido2 = "Ibañez"

            function crearUsuario(){
                Write-Host "Creando usuario: " $username
                Start-Sleep -Seconds 5
                $password = "Willian12345" | ConvertTo-SecureString -AsPlainText -Force
                New-ADUser -Name $username -GivenName $nombre1 -Surname $apellido1 -SamAccountName $username -Path "OU=Usuarios,OU=AITSOporte,DC=AITSoporte,DC=Local" -AccountPassword $Password -ChangePasswordAtLogon $False -Enabled $True -DisplayName ""
                Start-Sleep -Seconds 1
                    $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
                    if (!$usuario) { 
                        Write-Host "No se creo el usuario: " $username
                        Start-Sleep -Seconds 10
                    } 
                    else
                    {
                        Write-Host "Se creo el usuario: " $username 
                        Start-Sleep -Seconds 1
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
                        Start-Sleep -Seconds 1
                        } 
                    else
                        {
                        Write-Host "Existe el usuario: " $username
                        Start-Sleep -Seconds 1
                        }
                }
            }

            function primerNombre(){
            for($i = 1;$i -le $nombre1.Length;$i++)
                {
                $letra = $nombre1.Substring(0,$i)
                $cantidad = $letra.Length
                $queda = $nombre1.Length - $cantidad
                <# Write-Host $cantidad " de " $queda #>
                $username = $letra + $apellido1
                $usuario = Get-ADUser -Filter { SamAccountName -eq $username }
                    if (!$usuario) { 
                        Write-Host "No existe el usuario: " $username
                        crearUsuario $username $nombre1 $apellido1
                        Start-Sleep -Seconds 1
                        } 
                    else
                        {
                        Write-Host "Existe el usuario: " $username
                        Start-Sleep -Seconds 1
                        <# Write-Host "Quedan: " $queda #>
                            if($queda -eq 0){segundoNombre $username $nombre1 $apellido1}
                        }
                }
            }
            primerNombre
    
            # Fin While
            for($i = 1;$i -le 15;$i++)
                {
                    $b = 15
                    Clear-Host
                    $a = $b - $i
                    Write-Host "Inicia en: " $a
                    Start-Sleep -Seconds 1
                }
			#Start-Sleep -Seconds 15
	}
}
ad