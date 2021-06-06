Clear-Host
$reader = [System.IO.File]::OpenText("C:\CM\Teams\list.txt")
$rutaLog = "C:\CM\Teams\Teams.log"
try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        #$line

        $line1 = $line -split (";")
        $equipo = $line1[0]
        $usuario = $line1[1]
        

        # Write-Host "Equipo :" $equipo
        # Write-Host "Usuario :" $usuario
        $rutaEquipo = "\\$equipo\c$\"
        $conexion = Test-Path $rutaEquipo
        If ($conexion -eq $True)
        {
        $archivos = @("app.ico","setup.json","SquirrelSetup.log","Update.exe")        
        For ($i=0; $i -lt $archivos.Length; $i++) {
        $archivo1 = $archivos[$i]
        $rutaArchivo = "\\$equipo\c$\Users\$usuario\AppData\Local\Microsoft\Teams\$archivo1"
        $archivos[$i],$resultado

        $ruta = Test-Path $rutaArchivo
        If ($ruta -eq $True)
            {
            $mensaje = "Existe el archivo;" + $archivo1 + ";" + $equipo + ";" + $usuario
            $mensaje | Out-File -FilePath $rutaLog -Append
            }
            else
            {
            $mensaje = "No existe el archivo;"  + $archivo1 + ";" + $equipo + ";" + $usuario
            $mensaje | Out-File -FilePath $rutaLog -Append
            }
        }
        
        }
        else
        {
            $mensaje = "Equipo no responde;" + ";" + $equipo + ";" + $usuario
            $mensaje | Out-File -FilePath $rutaLog -Append
        }
     }   
}
finally 
{
    $reader.Close()
}