# cd en ps es:
Set-Location C:\Windows\Temp
#dir
Get-ChildItem
# Borrar archivos y carpetas
Remove-Item -Path C:\Windows\Temp\*.* -Force
#variables de entorno
$env
$env:TEMP
Get-ChildItem -Path $env:TEMP
Remove-Item -Path $env:TEMP -Force
#Defrag
Optimize-Volume -DriveLetter D -Analyze -AsJob  -Defrag -TierOptimize
Optimize-Volume -DriveLetter d -Analyze -AsJob -Defrag -TierOptimize -Verbose
