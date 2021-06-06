Clear-Host
$reader = [System.IO.File]::OpenText("E:\SMScript\Happy\list.txt")
$rutaLog = "E:\SMScript\Happy\LogHappy.log"
# (Get-Content E:\ConfigMgr\img\list.txt).count
try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        #$line

        $line1 = $line -split (";")
        $nombre = $line1[0]
        $correo = $line1[1]
        $diaHappy = $line1[2]
        $mesHappy = $line1[3]
        

        # Write-Host "Nombre :" $nombre
        # Write-Host "Correo :" $correo
        # Write-Host "Dia :" $diaHappy
        # Write-Host "Mes :" $mesHAppy
        
        $diaHoy = (get-date).Day
        $mesHoy = (get-date).Month
        $fecha = Get-Date               
        
        If ($diaHoy -eq $diaHappy)
            {
            if ($mesHoy -eq $mesHappy)
                {
                $mensaje = "Se envio correo de cumpleaños;"  + $nombre + ";" + $correo + ";" + $fecha
                $mensaje | Out-File -FilePath $rutaLog -Append
                $aviso = 'EnviarCorreo'
                }
                else
                {
                $aviso = 'NoEnviarCorreo'
                }
            }
            else
            {
            $aviso = 'NoEnviarCorreo'
            }
        }
}
finally 
{
    $reader.Close()
}