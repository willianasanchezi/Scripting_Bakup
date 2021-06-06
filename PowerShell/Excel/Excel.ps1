# Nuevo objeto de tipo Excel
$excel = New-Object -ComObject Excel.Application
# Abrir el archivo en segundo plano
$excel.Visible = $true
# No mostrar alertas
$excel.DisplayAlerts = $false
# Abrir el archio de excel
$libro = $excel.Workbooks.Open("E:\Sync\Scripting\PowerShell\Excel\Excel.xlsx")
$hoja = $libro.Worksheets 
$hoja | Get-Member
$hoja = $libro.Worksheets.Name



# Cerrar el archivo de excel
$excel.Quit()


<#
https://lazywinadmin.com/2014/03/powershell-read-excel-file-using-com.html#script-example
https://docs.microsoft.com/en-us/office/vba/api/excel.application.copyobjectswithcells
https://blog.victorsilva.com.uy/excel-desde-powershell/
https://stackoverflow.com/questions/32020644/extract-worksheets-from-excel-into-separate-files-with-powershell
https://stackoverflow.com/questions/37507942/powershell-to-rename-excel-sheet
https://forums.techguy.org/threads/solved-powershell-retrieving-excel-sheet-name.911029/
Use Powershell to Loop Through Worksheets in an Excel Workbook

https://gallery.technet.microsoft.com/office/4fafdb79-4e4b-4857-ab5b-2be0c5f397f7
#>
