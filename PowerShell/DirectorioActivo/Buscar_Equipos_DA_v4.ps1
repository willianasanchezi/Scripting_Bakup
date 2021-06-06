Import-Module ActiveDirectory
Clear-Host
$reader = [System.IO.File]::OpenText("C:\Windows\ConfigSC\list.txt")

try 
{
    for()
    {
        $line = $reader.ReadLine() 
        if ($line -eq $null) { break }
        $resultado = Get-ADComputer -Filter "Name -eq '$line'"
        
		
		     if ($resultado)
				{
					"$line Existe"
				}
			else
				{
					"$line No existe"
				}	
     }
}
finally 
{
    $reader.Close()
}

<# 
Get-ADComputer -Filter "Name -eq 'NombreEquipo'
Get-ADComputer -LDAPFilter "(name=*)" -SearchBase "CN=PPMDMIN476Z9,OU=Equipos_Corporativos,OU=Equipos,DC=mintic,DC=gov,DC=co"
Todos los equipos de una OU
Get-ADComputer -LDAPFilter "(name=*)" -SearchBase "OU=Equipos_Corporativos,OU=Equipos,DC=mintic,DC=gov,DC=co" | select name
#>