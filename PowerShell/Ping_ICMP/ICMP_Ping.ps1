<# 
https://www.404techsupport.com/2015/03/23/powershell-script-ping-multiple-computers/
El valor guardado en la variable $ping es true y sale al colocar 
el parametro -Quiet
#>
$rutaLog = "C:\Windows\Temp\Config\LogTest.log"
$equipo = "127.0.0.1"
$fecha = Get-Date
$ping =  Test-Connection $equipo -Count 2 -Quiet
if ($ping){
        $mensaje = "Responde a ICMP;" + $equipo + ";" + $fecha
        $mensaje | Out-File -FilePath $rutaLog -Append
        }
        else
        {
        $mensaje = "No Responde a ICMP" + $equipo + ";" + $fecha
        $mensaje | Out-File -FilePath $rutaLog -Append
}


<#
Test Masivo ICMP
#>
$reader = [System.IO.File]::OpenText("C:\Windows\Temp\ConfigSC\listado.txt")
$rutaLog = "C:\Windows\Temp\ConfigSC\LogTest.log"

try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        # Inicio
        $rutaLog = "C:\Windows\Temp\ConfigSC\LogTest.log"
        $fecha = Get-Date
        $ping =  Test-Connection $line -Count 2 -Quiet
        if ($ping)
            {
                $mensaje = "Responde a ICMP;" + $line + ";" + $fecha
                $mensaje | Out-File -FilePath $rutaLog -Append
            }
            else
            {
                $mensaje = "No Responde a ICMP;" + $line + ";" + $fecha
                $mensaje | Out-File -FilePath $rutaLog -Append
            }
        # Fin
     }
}
finally 
{
    $reader.Close()
}


