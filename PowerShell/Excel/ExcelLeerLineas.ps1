<#
https://stackoverflow.com/questions/19211632/read-excel-sheet-in-powershell
#>

$xlCellTypeLastCell = 11 
$startRow = 5 
$col = 2 

$excel = New-Object -Com Excel.Application
$wb = $excel.Workbooks.Open("C:\Users\Administrator\my_test.xls")

for ($i = 1; $i -le $wb.Sheets.Count; $i++)
{
    $sh = $wb.Sheets.Item($i)
    $endRow = $sh.UsedRange.SpecialCells($xlCellTypeLastCell).Row
    $city = $sh.Cells.Item($startRow, $col).Value2
    $rangeAddress = $sh.Cells.Item($startRow + 1, $col).Address() + ":" + $sh.Cells.Item($endRow, $col).Address()
    $sh.Range($rangeAddress).Value2 | foreach 
    {
        New-Object PSObject -Property @{ City = $city; Area = $_ }
    }
}

$excel.Workbooks.Close()


<#
http://sinnud-ps.blogspot.com/2013/05/read-excel-file-line-by-line.html
#>

# Open excel file and use specific sheet
    $objExcel=New-Object -ComObject Excel.Application
    $objExcel.Visible=$false
    $WorkBook=$objExcel.Workbooks.Open($strFileName)
    if ($strSheetName -eq "")
    {
    $worksheet = $WorkBook.sheets.Item(1)
    }
    else
    {
    $worksheet = $WorkBook.sheets.Item($strSheetName)
    }
# loop for each row of the excel file
    $intRowMax = ($worksheet.UsedRange.Rows).count
    for($intRow = 2 ; $intRow -le $intRowMax ; $intRow++)
    {
    $codeName  = $worksheet.cells.item($intRow,$intCode).value2
    $author    = $worksheet.cells.item($intRow,$intAuth).value2
    $createDate= $worksheet.cells.item($intRow,$intCrDt).value2
    $validate  = $worksheet.cells.item($intRow,$intVali).value2
    $validDate = $worksheet.cells.item($intRow,$intVlDt).value2
    }  
    $WorkBook.close()
    $objexcel.quit()
	
