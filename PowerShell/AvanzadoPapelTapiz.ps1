$reader = [System.IO.File]::OpenText("E:\ConfigMgr\img\list.txt")
$rutaLog = "E:\ConfigMgr\img\LogImagen.log"
$archivo1 = "E:\ConfigMgr\img\2\CachedImage_1920_1080_POS2.jpg"

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
        
        Write-Host "Equipo :" $equipo
        Write-Host "Usuario :" $usuario
        
        
        $archivo2 = "\\$equipo\c$\Users\$usuario\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_1920_1080_POS2.jpg"

        $ruta = Test-Path $archivo2
        If ($ruta -eq $True)
        {
        $hash1 = (Get-FileHash $archivo1).hash
        $hash2 = (Get-FileHash $archivo2).hash
        [bool]$comparar = $hash2.CompareTo($hash1)
        if ($comparar) {
                #Clear-Host
                $mensaje = "Imagen Diferente;" + $equipo + ";" + $usuario
                $mensaje | Out-File -FilePath $rutaLog -Append
                # [System.IO.File]::WriteAllText($rutaLog, $mensaje)
                # Remove-Item "\\$equipo\c$\Users\$usuario\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_1920_1080_POS2.jpg"
                # Remove-Item "\\$equipo\c$\Users\$usuario\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper"
                }
                else
                {
                $mensaje = "Imagen Igual;" + $equipo + ";" + $usuario
                $mensaje | Out-File -FilePath $rutaLog -Append
                }
        
     }
     else
     {
        $mensaje = "Equipo no responde;" + $equipo + ";" + $usuario
        $mensaje | Out-File -FilePath $rutaLog -Append
     }

     }
}
finally 
{
    $reader.Close()
}