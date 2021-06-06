Clear-Host

$fecha = Get-Date

$rutaRutaLog = "D:\App\PS\AD\"
$rutaArchivoLog = "D:\App\PS\AD\LogAD.log"
$archivo = "D:\App\PS\AD\Planta_Mintic_Abril_2020.xlsx"
$existeRutaLog = Test-Path -Path $rutaRutaLog
$existeArchivoLog = Test-Path -Path $rutaArchivoLog
$existeArchivoXlsx = Test-Path -Path $archivo

if ($existeRutaLog)
{
Write-Host "Existe Ruta" $rutaRutaLog
    if($existeArchivoXlsx){
        $mensaje = "Inicia proceso" + ";" + $fecha
        $mensaje | Out-File -FilePath $rutaArchivoLog -Append
        Start-Process $rutaArchivoLog
    }
    else
    {
        Write-Host "NO Existe Archivo " $archivo ";" $fecha     
        break
    }
}
else
{
Write-Host "NO Existe ruta " $rutaRutaLog ";" $fecha 
break
} 
$nombreHoja = "KactuS - QryBiEmple"

$excel = New-Object -com Excel.Application
$libro = $excel.workbooks.open($archivo)
$hoja = $libro.Worksheets.Item($nombreHoja)
$ultimaFila = ($hoja.UsedRange.Rows).Count

$informacion = New-Object -TypeName psobject
$informacion | Add-Member -MemberType NoteProperty -Name IDENTIFICACION -Value $null
$informacion | Add-Member -MemberType NoteProperty -Name NOMBRES -Value $null
$informacion | Add-Member -MemberType NoteProperty -Name APELLIDOS -Value $null

# $arreglo = @()

for ($i = 2; $i -le $ultimaFila; $i++)
{
    $objTemp = $informacion | Select-Object *
   
    
    $objTemp.IDENTIFICACION = $hoja.Cells.Item($i,2).Text
    $objTemp.NOMBRES = $hoja.Cells.Item($i,3).Text
    $objTemp.APELLIDOS = $hoja.Cells.Item($i,4).Text
    
    $identificacion = $objTemp.IDENTIFICACION
    $nombres = $objTemp.NOMBRES
    $apellidos = $objTemp.APELLIDOS
    $primernombre = $nombres.Split("")
    $n1 = $primernombre[0].Substring(0,1)
    $primerapellido = $apellidos.Split("")
    $a1 = $primerapellido[0] # .Substring(0,1)
    $logon = $n1 + $a1

    # Validar usuario
        #Clear-Variable $usuario # Deja la variable limpia, porque se estaba guardando el valor de la variable
        $usuario = Get-ADUser -Filter * -Properties * | Where-Object {$_.PostalCode -eq $identificacion}
        if($usuario){
        #Clear-Host
        #Write-Output "Existe: " $identificacion
        $mensaje = "Usuario existe: " + $identificacion + "; " + $fecha
        $mensaje | Out-File -FilePath $rutaArchivoLog -Append
        }
        else
        {
        #Clear-Host
        #Write-Output "No existe: " $identificacion
        $mensaje = "Usuario NO existe: " + $identificacion + "; " + $fecha
        Write-Host $identificacion $nombres $apellidos
        Write-Host "Logon: " $logon

        $mensaje | Out-File -FilePath $rutaArchivoLog -Append
        }
 #   Write-Host $identificacion
    #Write-Host $objTemp.IDENTIFICACION $objTemp.NOMBRES $objTemp.APELLIDOS
   
    #$arreglo += $objTemp
}

<#
foreach ($dato in $arreglo)
{
    Echo $dato
}
#>
$excel.Quit()

#force stop Excel process
Stop-Process -Name EXCEL -Force

<#
Set-ADUser -Identity administrator -PostalCode "54321"
New-ADUser -SamAccountName "wsanchez" -UserPrincipalName wsanchez@aitsoporte.com -Name "Willian" -Path "OU=Usuarios,OU=AITSoporte,DC=AITSoporte,DC=local" -AccountPassword (ConvertTo-SecureString "Colombia2020" -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $false -ChangePasswordAtLogon $true -PassThru
New-ADUser -SamAccountName "wsanchez" -UserPrincipalName wsanchez@aitsoporte.com -Name "Willian" -Path "OU=Usuarios,OU=AITSoporte,DC=AITSoporte,DC=local" -AccountPassword (ConvertTo-SecureString "Colombia2020" -AsPlainText -Force) -Enabled $true -AccountExpirationDate 22/05/20 -ChangePasswordAtLogon $true -PassThru
Set-ADAccountExpiration -Identity wsanchez -DateTime 30/07/20
Set-ADUser -Identity administrator -PostalCode "54321"
Set-ADUser -Identity administrator -PostalCode "54321"
https://docs.microsoft.com/en-us/powershell/module/addsadministration/new-aduser?view=win10-ps#examples
#>
