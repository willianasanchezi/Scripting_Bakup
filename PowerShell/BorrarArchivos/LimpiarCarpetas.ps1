Get-Volume
Get-ChildItem D:\BkLinuxDBs\_Calidad
Get-ChildItem D:\BkLinuxDBs\Desarrollo
Get-ChildItem D:\BkLinuxDBs\Productivo
Get-ChildItem D:\BkLinuxDBs\_Solman

Clear-Host
$Logs = "D:\BkLinuxDBs\Logs\LogsBorrado.log"

$ruta = "D:\BkLinuxDBs\"
$ext = "\*.*"
$carpetas = @("_Calidad", "Desarrollo", "Productivo", "_Solman")
For ($i=0; $i -lt $carpetas.Length; $i++){
    $contenido = $ruta + $carpetas[$i]
    $resultado = Get-ChildItem $contenido
    $resultado #| Out-File $Logs
    $archivos = $contenido + $ext
    $archivos
    $borrado = Remove-Item $archivos -Force
    $borrado
}
Remove-Item D:\BkLinuxDBs\Desarrollo\FULLDEV -Force
Remove-Item D:\BkLinuxDBs\Productivo\MARTES -Force
Get-Volume


# Version 2
Get-ChildItem D:\BkLinuxDBs\Productivo
Remove-Item D:\BkLinuxDBs\Productivo\* -Force
Get-ChildItem D:\BkLinuxDBs\Productivo