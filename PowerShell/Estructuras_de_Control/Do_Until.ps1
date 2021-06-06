<#
Ejemplo 1
En este caso se esta validando la ruta, si existe la carpeta 1 (el resultado de la validacion es True) 
la linea echo "Test" se ejecutara solo una vez
#>  
    do
        {       
        $ruta = Test-Path C:\1
        echo "Test"
        Start-Sleep -s 10 # Para que no consuma memoria RAM en Powershell
        }       
    until ($ruta) # La carpeta existe


<#
Ejemplo 2
En este caso se esta validando la ruta, si NO existe la carpeta 1 (el resultado de la validacion es False) 
la linea echo "Test" se ejecutara solo una vez
#>
    do
        {       
        $ruta = Test-Path C:\1
        echo "Test"
        Start-Sleep -s 10 # Para que no consuma memoria RAM en Powershell
        }       
    until (!$ruta) # La carpeta no existe