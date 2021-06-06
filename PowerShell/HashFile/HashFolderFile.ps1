Clear-Host
$rutaLog = "C:\TI\LogHash.log"
$listado = Get-childitem C:\TI\* -Recurse -include *.cab,*.cmd
Get-FileHash -Path $listado | Format-List | Out-File -FilePath $rutaLog -Append
