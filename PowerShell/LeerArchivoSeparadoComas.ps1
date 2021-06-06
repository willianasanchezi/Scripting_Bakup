<#
Archivo list.txt
1;A
2;B
#>

$reader = [System.IO.File]::OpenText("C:\list.txt")

try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        $line

        $line1 = $line -split (";")
        $equipo = $line1[0]
        $usuario = $line1[1]
        Write-Host "Equipo :" $equipo
        Write-Host "Usuario :" $usuario
     }
}
finally 
{
    $reader.Close()
}
