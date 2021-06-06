# $linea = (Get-Content -Path C:\tmp\Usuarios.csv).Length

$rutaArchivo = "D:\tmp\Usuarios.csv"
$antiguo = '"enabled","Office","Name","POBox","UserPrincipalName","dateOfBirth"'
$nuevo = '"false","Test","Test","Test","wsanchez@coem.co",""'
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 


$antiguo = "#TYPE Selected.Microsoft.ActiveDirectory.Management.ADUser"
$nuevo = '"enabled","Office","Name","POBox","UserPrincipalName","dateOfBirth"'
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo 

$antiguo = '"'
$nuevo = ''
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo

<#
$antiguo = '/'
$nuevo = ','
(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
Write-Host $antiguo $nuevo
#>
$linea = Get-Content -Path C:\tmp\Usuarios.csv -TotalCount 2
Clear-Host
$linea


####
<#
$dia = Get-Date -Format "dd"
$mes = Get-Date -Format "MM"
$fecha = $mes + "/" + $dia
# $fecha = "10/20/"
Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,dateOfBirth | where-object {$_.dateOfBirth -like "*$fecha*" } | Export-Csv C:\Windows\Temp\Usuarios.csv -Encoding UTF8
#>

Get-Content C:\tmp\Usuarios.csv | Set-Content -Encoding utf8 C:\tmp\UsuariosUTF8.csv
$rutaArchivo = [System.IO.File]::OpenText("C:\tmp\UsuariosUTF8.csv")
try 
{
    for() 
    {
        $linea = $rutaArchivo.ReadLine()
        if ($linea -eq $null) { break }

        $linea1 = $linea -split (",")
        $nombre = $linea1[2]
        $sexo = $linea1[3]
        $correo = $linea1[4]

        Write-Host $nombre","$sexo","$correo 
    }
}
finally 
{
    $rutaArchivo.Close()
}

<#
Remove-Item C:\tmp\Usuarios.csv
Copy-Item C:\tmp\UsuariosBk.csv -Destination C:\tmp\Usuarios.csv
#>