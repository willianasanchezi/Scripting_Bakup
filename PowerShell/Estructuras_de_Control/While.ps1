<#
Ejemplo 1
En este caso se esta validando la ruta, si existe la carpeta 1 (el resultado de la validacion es True) 
la linea echo "Test" se ejecutara infinitamente, asi el nombre de la carpeta cambie
#>
$ruta = Test-Path C:\1
while($ruta)
{
echo "Test"
Start-Sleep -s 10 # Para que no consuma memoria RAM en Powershell
}