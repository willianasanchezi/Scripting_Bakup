$fecha = (Get-Date).AddDays(-1)
$year = $fecha.Year
$mes = $fecha.Month
$dia = $fecha.Day
Get-ChildItem E:\InetPub\CiresonPortal\Logs -Recurse | select CreationTime, FullName | Where-Object {$_.CreationTime -like "*$mes/$dia/$year*"} | ForEach-Object { Remove-Item -LiteralPath $_.FullName}