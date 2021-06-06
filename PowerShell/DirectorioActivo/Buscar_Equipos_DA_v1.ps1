# Aca se colocan variables
Import-Module ActiveDirectory
$reader = [System.IO.File]::OpenText("C:\Windows\Temp\list.txt") # Lee archivo de texto que contiene los numeros de casos o actividades

try 
{
    for() # Bucle para leer el contenido del archivo de texto
    {
        $line = $reader.ReadLine() # Variable que guarda 
        if ($line -eq $null) { break }
        # Inicia Proceso
		Get-ADComputer -Filter "Name -eq '$line'"
        # Finaliza Proceso
        $line
     }
}
finally 
{
    $reader.Close()
}


