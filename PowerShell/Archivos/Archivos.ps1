# Crear archivo
$Ruta= "E:\SMFiles\"
    #Create file
    $Archivo = $Ruta + "AR_Email_Body.txt"
    New-Item  ($Archivo) -Type file -Force|Out-Null
    Add-Content $Archivo ""

    $Archivo = $Ruta + "AR_Email_From.txt"
    New-Item  ($Archivo) -Type file -Force|Out-Null
    Add-Content $Archivo ""

# Borrar archivo
Remove-Item "E:\SMFiles\AR_Email_Body.txt"
Remove-Item "E:\SMFiles\AR_Email_From.txt"