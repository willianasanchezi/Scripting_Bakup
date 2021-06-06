

Clear-Host
$rutaLog = "E:\Sync\Trabajo\MINTIC\SCSM\Reportes\LogExcel.log"
$rutaExcel = "E:\Sync\Trabajo\MINTIC\SCSM\Reportes\Reporte_Base.xlsx"
$excel = new-object -comobject excel.application  
$excel.Visible = $True # Abrir 
$excel.DisplayAlerts = $false
$libro = $excel.Workbooks.Open($rutaExcel)

foreach ($hoja in $libro.Worksheets) { 
    $hojas = $hoja.Name
    Write-Host($hojas)
    # $hojas | Out-File -FilePath $rutaLog -Append
}


function detenerExcel() 
{
Stop-Process -Name EXCEL -Force
Get-Process -Name EXCEL
}
detenerExcel
