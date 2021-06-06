Import-Module ActiveDirectory #  Importar modulo Directorio Activo
$reader = [System.IO.File]::OpenText("C:\Windows\Temp\list.txt") # Leer archivo de texto en la ruta C:\Windows\Temp\

try 
{
    for() # Inicia For
    {
        $line = $reader.ReadLine() 
        if ($line -eq $null) { break }
        $resultado = Get-ADComputer -Filter "Name -eq '$line'"
        
     } # Finaliza For

     if ($resultado) # Se evalua resultado
     {
         "$line Existe" # Mensaje si el resultado es verdadero 
     }
     else
     {
         "$line No existe"  # Mensaje si el resultado es falso
     }


}
finally 
{
    $reader.Close() # Finaliza lectura del archivo de texto
}