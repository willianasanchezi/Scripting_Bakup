Get-Item * | where-object {$_.Name -like "*SMS_ISVU*"}

Get-ChildItem E:\CM\Inventario | select *
Get-ChildItem E:\CM\Inventario -Recurse -Filter *.xls | select CreationTime, FullName | Where-Object { $_.FullName -like "*nombrearchivo*"}
Get-ChildItem E:\CM\Inventario -Recurse -Filter *.xls | select CreationTime, FullName | Where-Object { $_.CreationTime -like "*2019*"}
Get-ChildItem F:\SoftwareLibrary -Recurse -Filter *.exe | select CreationTime, FullName | Where-Object { $_.CreationTime -like "*02*" -and $_.CreationTime -like "*2019*"}

<# Tener en cuenta el formato de fecha en el equipo en este caso es mm/dd/yyyy #>
Get-ChildItem F:\SoftwareLibrary -Recurse | select CreationTime, FullName | Where-Object {$_.CreationTime -like "*8/13/2019*"}
Get-ChildItem F:\SoftwareLibrary -Recurse | select CreationTime, FullName | Where-Object {$_.CreationTime -like "*10/08/2019*"}
Get-ChildItem E:\InetPub\CiresonPortal\Logs -Recurse | select CreationTime, FullName | Where-Object {$_.CreationTime -like "*04/27/2021*"}
Get-ChildItem E:\InetPub\CiresonPortal\Logs -Recurse | select CreationTime, FullName | Where-Object {$_.CreationTime -like "*04/27/2021*"} | ForEach-Object { Remove-Item -LiteralPath $_.FullName}

<#
https://devops-collective-inc.gitbook.io/the-big-book-of-powershell-gotchas-spanish/obtener-tamanos-de-carpetas
La carpeta no tiene tamaño se suma el tamaño de los archivos contenidos en la carpeta
Opcion 1 #>
Get-ChildItem -Path E:\tmp -File -Recurse | Measure-Object -Property Length -Sum

<# Opcion 2 #>
Get-ChildItem -Path E:\tmp -File -Recurse | Foreach {
    $Files = Get-ChildItem $_.FullName -Recurse -File
    $Size = '{0:N2}' -f (( $Files | Measure-Object -Property Length -Sum).Sum /1MB)
    [PSCustomObject]@{Profile = $_.FullName ; TotalObjects = "$($Files.Count)" ; SizeMB = $Size}
}

<# 
Fuente: https://www.enmimaquinafunciona.com/pregunta/42906/como-puedo-saber-el-tamano-de-una-carpeta-con-el-uso-de-powershell
Opcion 2 
#>
function Size { 
param([string]$pth) 
"{0:n2}" -f ((gci -path $pth -recurse | measure-object -property length -sum).sum /1mb) + " mb" 
}
Size E:\tmp

####
function Size { param([string]$pth)  "{0:n2}" -f ((gci -path $pth -recurse | measure-object -property length -sum).sum /1mb) + " mb" }
Size E:\tmp