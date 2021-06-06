
# Opcion 1 #
# https://stackoverflow.com/questions/42622512/compare-two-bmp-files-with-get-filehash
$archivo1 = "E:\img\1\CachedImage_1920_1080_POS2.jpg"
$archivo2 = "E:\img\2\CachedImage_1920_1080_POS2.jpg"

$hash1 = (Get-FileHash $archivo1).hash
$hash2 = (Get-FileHash $archivo2).hash
[bool]$comparar = $hash2.CompareTo($hash1)
if ($comparar) {
Clear-Host
Write-Host "Diferente"
}
else
{
Clear-Host
Write-Host "Igual"
}

##

###

C:\Users\SCTEST01\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles
PC0FKBMX	fcaro	PAOFTIFKBMX	

Clear-Variable
Get-FileHash -Path E:\img\1\CachedImage_1920_1080_POS2.jpg

Get-Item -Path E:\img\1\CachedImage_1920_1080_POS2.jpg | Get-FileHash

$varlor3 = Get-FileHash -Path E:\img\1\CachedImage_1920_1080_POS2.jpg
Write-Host $valor3

$varlor2 = Get-FileHash -Path E:\img\2\CachedImage_1920_1080_POS2.jpg
Write-Host = $valor2

$leftDir = Get-Item -Path E:\img\1\
$rightDir = Get-Item -Path E:\img\2\

$differentFiles = Get-ChildItem $leftDir | Where-Object {($_ | Get-FileHash).Hash -ne (Get-FileHash (Join-Path $rightDir $_.Name)).Hash
} 
if (-not $differentFiles)
{
    'All files are the same'
}
else
{
    $differentFiles | Foreach-Object {Write-Output "File $($_.Name) is different"}
}


###


$equipo = "PAOFTI19656"
$usuario = "eguzman"
# A1170E39DCBCB20E76B2A4CF878AFCF704F6B71D49A3E765B03D64AEA3591CD4
Get-ChildItem "\\$equipo\c$\Users\$usuario\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_1920_1080_POS2.jpg" | Get-FileHash  -Algorithm SHA256
Remove-Item "\\$equipo\c$\Users\$usuario\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_1920_1080_POS2.jpg"
Remove-Item "\\$equipo\c$\Users\$usuario\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper"

##

$archivo1 = "\\Daofti5pd4p\c$\Users\lmlugo\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_1920_1080_POS2.jpg"
$archivo2 = "E:\ConfigMgr\img\2\CachedFiles\CachedImage_1920_1080_POS2.jpg"

##



$leftDir = Get-Item -Path "\\Daofti5pd4p\c$\Users\lmlugo\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\"
$rightDir = Get-Item -Path "E:\ConfigMgr\img\2\"

$differentFiles = Get-ChildItem $leftDir | Where-Object {
($_ | Get-FileHash).Hash -ne (Get-FileHash (Join-Path $rightDir $_.Name)).Hash
} 
if (-not $differentFiles)
{
    'Archivos Iguales'
}
else
{
    $differentFiles | Foreach-Object {Write-Output "Archivos $($_.Name) Diferentes"}
}

##
