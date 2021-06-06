Clear-Host
$consulta = Get-Service | Where-Object {$_.name -eq "Audiosrv" -band $_.Status -eq "Running"}
$consulta
Clear-Host
if (!$consulta)
{
    $aviso = "El servicio no Existe, o no esta ejecutandose"
}
else
{
    $aviso = "El servicio Existe"
}
$aviso
