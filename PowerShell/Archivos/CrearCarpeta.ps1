$dia = get-date -Format "dd" 
$mes = get-date -Format "MM"
$year = get-date -Format "yyyy"
$hora = get-date -Format "HH"
$minuto = get-date -Format "mm"
Clear-Host
$msg = -join($year, $mes, $dia, $hora, $minuto)
$carpeta = -join("E:\tmp\Bk_",$msg)
New-Item -Path $carpeta -ItemType Directory
Clear-Host