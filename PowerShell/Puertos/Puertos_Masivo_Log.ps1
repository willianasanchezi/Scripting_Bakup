
$reader = [System.IO.File]::OpenText("C:\Windows\Temp\ConfigSC\listado.txt")
$rutaLog = "C:\Windows\Temp\ConfigSC\LogTest.log"

try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        # Inicio
#        $rutaLog = "C:\Windows\Temp\Config\LogTest.log"
        $fecha = Get-Date
        $ping = Test-NetConnection -Port 22 -ComputerName $line -InformationLevel Quiet
        #$ping =  Test-Connection $line -Count 2 -Quiet
        if ($ping)
            {
                $mensaje = "Responde a puerto 22;" + $line + ";" + $fecha
                $mensaje | Out-File -FilePath $rutaLog -Append
            }
            else
            {
                $mensaje = "No Responde a puerto 22;" + $line + ";" + $fecha
                $mensaje | Out-File -FilePath $rutaLog -Append
            }
        # Fin
     }
}
finally 
{
    $reader.Close()
}
