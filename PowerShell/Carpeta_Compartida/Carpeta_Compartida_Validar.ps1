leer = [System.IO.File]::OpenText("C:\Windows\Temp\ConfigSC\listado.txt")
$rutaLog = "C:\Windows\Temp\ConfigSC\LogCliente.log"

try
{
    for()
    {
        $linea = $leer.ReadLine()
        if ($linea -eq $null) { break }

        $ruta = "\\$linea\c$"
        $validarRuta = Test-Path $ruta

        if($validarRuta -eq $true){
            $mensaje = "Equipo responde;" + $linea
            $mensaje | Out-File -FilePath $rutaLog -Append
                
        }
        else
        {
            $mensaje = "Equipo NO responde;" + $linea
            $mensaje | Out-File -FilePath $rutaLog -Append
        }
    }
}
finally

{
    $leer.Close()
}