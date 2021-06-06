<# Ejecutar como administrador #>


<# 
La siguiente funcion valida sino existe un servicio
#>
function sevicioexiste ()
{
    Clear-Host
    $consulta1 = Get-Service | Where-Object {$_.Name -eq "Audiosrv"}
    Clear-Host
    # Signo de ! es -not o not equal
    if (!$consulta1)
    {
        $aviso1 = "NoExiste"
    }
    else
    {
            # Inicia detener servicio
            Clear-Host
            $consulta = Get-Service | Where-Object {$_.Name -eq "Audiosrv" -band $_.Status -eq "Running"}
            Clear-Host
            # Signo de ! es -not o not equal
            if (!$consulta)
            {
                $aviso2 = "No esta Running"
            }
            else
            {
                $aviso2 = "Esta Running"
                Stop-Service -Name "Audiosrv"
                Start-Sleep -s 30
                # Llama la funcion borrarcarpeta
                borrarcarpeta
                
            }
            $aviso2
            # Fin detener servicio
    }
    $aviso1
}
#

function borrarcarpeta ()
{
    Clear-Host
    do
        {
        # Consulta de estado del servicio
        $consulta = Get-Service | Where-Object {$_.Name -eq "Audiosrv" -band $_.Status -eq "Stopped"}  
        }
        # Mientras el servicio no se encuentre detenido se va a seguir ejecutando la consulta
    while (!$consulta)
    
    
    # Colocamos la ruta en una variable
    $ruta1 = "C:\Windows\Temp\"
    # Con el comando Test-Path validamos la ruta, si existe de True sino da False
    $existeruta = Test-Path $ruta1
    # Validamos si el resultado del test es True o False
    if ($existeruta -eq $True)
        {
        # Si es True se guarda el siguiente texto en la variable $aviso
        $aviso = "Archivo Existe"
        # Inicio Borrar Carpetas
        Remove-Item C:\Windows\Temp\ -Recurse
        Remove-Item C:\Windows\SoftwareDistribution\ -Recurse
        # Fin Borrar Carpetas
        Start-Sleep -s 30
        }
    else
        {
        # Si es False se guarda el siguiente texto en la variable $aviso
        $aviso = "Archivo No Existe"
        }
    # Limpia pantalla
    Clear-Host
    Start-Service -Name "Audiosrv"
    # En la siguiente variable se muestra el resultado del aviso
    $aviso            
}

sevicioexiste