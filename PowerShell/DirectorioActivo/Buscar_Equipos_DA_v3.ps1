Import-Module ActiveDirectory
$reader = [System.IO.File]::OpenText("C:\Windows\Temp\list.txt")

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