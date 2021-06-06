<#
Listado con los nombre de las hojas
#>

$rutaLog = "E:\Sync\Scripting\PowerShell\Excel\LogExcel.log"
$rutaExcel = "E:\Sync\Scripting\PowerShell\Excel\Excel.xlsx"
# Kill procesos de excel
Get-Process -Name EXCEL
Stop-Process -Name EXCEL -Force
# El archivo de EXCEL debe estar cerrado
$objExcel = new-object -comobject excel.application  
$objExcel.Visible = $False 
$objExcel.DisplayAlerts = $false
$objWorkbook = $objExcel.Workbooks.Open($rutaExcel) 

foreach ($objWorksheet in $objWorkbook.Worksheets) { 
    $hoja = $objWorksheet.Name
    Write-Host($hoja)
   $hoja | Out-File -FilePath $rutaLog -Append
} 

<#
https://mcpmag.com/articles/2018/04/06/find-excel-data-with-powershell.aspx
$Buscar = $WorkSheet.Cells.Find('Nombre')


#>
$objExcel.Workbooks.Close()


<#
#>
    
$excelFile = "E:\Sync\Scripting\PowerShell\Excel\Validacion_Postal.xls"
$E = New-Object -ComObject Excel.Application
$E.Visible = $false
$E.DisplayAlerts = $false
$wb = $E.Workbooks.Open($excelFile)
    foreach ($ws in $wb.Worksheets)
    {
        $n = $excelFileName + "_" + $ws.Name
        Write-Host($n)
    }