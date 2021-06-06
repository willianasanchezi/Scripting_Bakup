$ruta1 = "C:\Windows\Temp\"
$ruta2 = "C:\Windows\SoftwareDistribution\"
# Validar si existe

# Al validar la ruta 
#True Existe 
#False No Existe
Test-Path $ruta1

# Eliminar
Remove-Item $ruta1 -Recurse
# Remove-Item C:\Users\admincoem\AppData\Local\Temp\ -Recurse
Remove-Item $ruta2 -Recurse




<# #>
# Colocamos la ruta en una variable
$ruta1 = "C:\Windows\Temp\"
# Con el comando Test-Path validamos la ruta, si existe de True sino da False
$existeruta = Test-Path $ruta1
# Validamos si el resultado del test es True o False
if ($existeruta -eq $True)
{
    # Si es True se guarda el siguiente texto en la variable $aviso
    $aviso = "Archivo Existe"
}
else
{
    # Si es False se guarda el siguiente texto en la variable $aviso
    $aviso = "Archivo No Existe"
    
}
# Limpia pantalla
Clear-Host
# En la siguiente variable se muestra el resultado del aviso
$aviso
<# #>