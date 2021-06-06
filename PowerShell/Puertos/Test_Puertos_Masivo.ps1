<# Test resultado boleano 
Si el puerto esta abierto es true y si esta cerrado es false
#>
Test-NetConnection -Port 135 -ComputerName 127.0.0.1 -InformationLevel Quiet

<#
Test Masivo ICMP
#>
$reader = [System.IO.File]::OpenText("C:\Windows\Temp\Config\listado.txt")
$rutaLog = "C:\Windows\Temp\Config\LogTest.log"

try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        # Inicio
        $rutaLog = "C:\Windows\Temp\Config\LogTest.log"
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

<#
Test Masivo ICMP incluyendo puertos
161/tcp, 162/tcp, 22/tcp, 23/tcp, 443/tcp
#>
Clear-Host
$servidores = @("CURCUMA.aitsoporte.local","violeta.aitsoporte.local")
$puertos = @(135, 139, 445)
For ($i=0; $i -lt $servidores.Length; $i++){
    For ($j=0; $j -lt $puertos.Length; $j++){
    $resultado = Test-NetConnection $servidores[$i] -port $puertos[$j]
    $resultado 
    }
}


<#
Test Masivo ICMP incluyendo puertos
161/tcp, 162/tcp, 22/tcp, 23/tcp, 443/tcp
Boleano
#>
Clear-Host
$servidores = @("127.0.0.1","133.1.1.1")
# $servidores = @("CURCUMA.aitsoporte.local","violeta.aitsoporte.local")
$puertos = @(135, 139, 445)
$rutaLog = "C:\Windows\Temp\Config\LogTest.log"

For ($i=0; $i -lt $servidores.Length; $i++)
    {
    For ($j=0; $j -lt $puertos.Length; $j++)
    {
    $resultado = Test-NetConnection $servidores[$i] -port $puertos[$j]
        if ($resultado)
        {
            $mensaje = "Puerto: " + $puertos[$j] + " abierto" + ";" + $line + ";" + $fecha
            $mensaje | Out-File -FilePath $rutaLog -Append
        }
        else
        {
            $mensaje = "Puerto: " + $puertos[$j] + " cerrado" + ";" + $line + ";" + $fecha
            $mensaje | Out-File -FilePath $rutaLog -Append
        }
    }
}
