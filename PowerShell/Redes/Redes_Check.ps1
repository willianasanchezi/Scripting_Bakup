<#
Clear-Host
$reader = [System.IO.File]::OpenText("C:\Windows\Temp\list.txt")


try 
{
    for()
    {
        $line = $reader.ReadLine() 
        if ($line -eq $null) { break }
        # $resultado = Test-Connection $line
        $resultado = Resolve-DnsName -Name $line
        # $line
      
        if ($resultado)
            {
               "$line;Resuelve DNS"
            }
        else
            {
                "$line;No Resuelve DNS"
            }
     }
}
finally 
{
    $reader.Close()
}
#>
$equipo = "PAOFTIAC1615"
Test-Connection $equipo
Test-NetConnection $equipo -port 135
Resolve-DnsName $equipo

