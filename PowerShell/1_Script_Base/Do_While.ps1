<#

do{
   loop body instructions
}
while/until(condition)

#>
Clear-Host
do
{
    # Consulta de estado del servicio
    $consulta = Get-Service | Where-Object {$_.Name -eq "Audiosrv" -band $_.Status -eq "Stopped"}  
}
# Mientras el servicio no se encuentre en servicio detenido se va a seguir ejecutando la consulta
while (!$consulta)