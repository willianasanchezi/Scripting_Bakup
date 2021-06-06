<# 
Get-EventLog -LogName Security -InstanceId 4724 | Where-Object {$_.Message -like "*Account Name*"}
Get-EventLog -LogName "Operations Manager" -After "03/16/2021 7:00:00 AM" -Before "03/16/2021 8:00:00 AM" | Where-Object {$_.Message -like "*Account*"}
#>
param (
    [string] $mensaje,
    [string] $evento = "47241"
)
try{
Clear-Host
Write-Output "Inicia ejecuccion"
$mensaje = Get-EventLog -LogName Security -InstanceId $evento | select -ExpandProperty message #  -ErrorAction Stop
if($mensaje){
            $mensaje = $mensaje -split "`n"
            $mensaje  | Select-String -Pattern 'Account Name' #| Export-Csv D:\tmp\Account.csv -Encoding UTF8
            }
            else
            {
            Write-Output "No existe el evento"
            }
}
catch [System.Exception]
{
    Clear-Host
    Write-Warning "Se encontro un error en la ejecuccion"
    $_.Exception.Message
}
finally {
#Clear-Host
Write-Output "Finaliza ejecuccion"
}
