# La siguiente funcion valida sino existe un servicio
function sevicioexiste ()
{
    Clear-Host
    $consulta = Get-Service | Where-Object {$_.Name -eq "Audiosrv"}
    $consulta
    Clear-Host
    # Signo de ! es -not o not equal
    if (!$consulta)
    {
        $aviso = "NoExiste"
    }
    else
    {
        $aviso = "Existe"
    }
    $aviso
}
# En esta linea se ejecuta la funcion
sevicioexiste
