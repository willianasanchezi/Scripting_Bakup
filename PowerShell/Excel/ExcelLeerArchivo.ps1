<#
http://miteshsureja.blogspot.com/2018/05/read-excel-file-data-using-powershell.html
#>

#select excel file you want to read
$file = "D:\App\PS\Excel\MyContacts.xlsx"
$sheetName = "Sheet1"

#create new excel COM object
$excel = New-Object -com Excel.Application

#open excel file
$wb = $excel.workbooks.open($file)

#select excel sheet to read data
$sheet = $wb.Worksheets.Item($sheetname)

#select total rows
$rowMax = ($sheet.UsedRange.Rows).Count

#create new object with Name, Address, Email properties.
$myData = New-Object -TypeName psobject
$myData | Add-Member -MemberType NoteProperty -Name Name -Value $null
$myData | Add-Member -MemberType NoteProperty -Name Address -Value $null
$myData | Add-Member -MemberType NoteProperty -Name Email -Value $null

#create empty arraylist
$myArray = @()

for ($i = 2; $i -le $rowMax; $i++)
{
    $objTemp = $myData | Select-Object *
   
    #read data from each cell
    $objTemp.Name = $sheet.Cells.Item($i,1).Text
    $objTemp.Address = $sheet.Cells.Item($i,2).Text
    $objTemp.Email = $sheet.Cells.Item($i,3).Text
    #Write-Host 'Name-' $objTemp.Name 'Address-' $objTemp.Address 'Email-' $objTemp.Email
   
    $myArray += $objTemp
}
#print $myarry object
#$myArray
#print $myarry object with foreach loop
foreach ($x in $myArray)
{
    Echo $x
}

$excel.Quit()

#force stop Excel process
Stop-Process -Name EXCEL -Force