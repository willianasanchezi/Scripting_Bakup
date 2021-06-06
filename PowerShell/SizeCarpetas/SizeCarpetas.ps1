<#
https://www.pantallazos.es/2018/07/windows-powershell-listar-tamano-carpetas-csv.html
#>
Get-ChildItem -path "C:\Users" | Foreach {
$Files = Get-ChildItem $_.FullName -Recurse -File
$Size = '{0:N2}' -f (( $Files | Measure-Object -Property Length -Sum).Sum /1MB)
[PSCustomObject]@{Profile = $_.FullName ; TotalObjects = "$($Files.Count)" ; SizeMB = $Size}
} | Format-List

Get-ChildItem -Path "C:\Users" -File -Recurse | Measure-Object -Property Length -Sum