<#
https://lazywinadmin.com/2014/03/powershell-read-excel-file-using-com.html#com-interface-excelapplication
https://msdn.microsoft.com/en-us/library/bb149081.aspx
#>

$objExcel = new-object -comobject excel.application  
$objExcel.Visible = $False 
$objExcel.DisplayAlerts = $false

$WorkBook = $objExcel.Workbooks.Open("C:\VIDEOSERVER01-BuildSpecs.xlsx")
$objExcel.WorkBooks | Select-Object -Property name, path, author
$objExcel.WorkBooks | Get-Member
$WorkBook | Get-Member -Name *sheet*
$WorkBook.sheets | Select-Object -Property Name
$WorkSheet = $WorkBook.sheets.item("Hoja1")

$objExcel.Workbooks.Close()



###########

# Specify the path to the Excel file and the WorkSheet Name
$FilePath = "C:\VIDEOSERVER01-BuildSpecs.xlsx"
$SheetName = "BuildSpecs"

# Create an Object Excel.Application using Com interface
$objExcel = New-Object -ComObject Excel.Application

# Disable the 'visible' property so the document won't open in excel
$objExcel.Visible = $false

# Open the Excel file and save it in $WorkBook
$WorkBook = $objExcel.Workbooks.Open($FilePath)

# Load the WorkSheet 'BuildSpecs'
$WorkSheet = $WorkBook.sheets.item($SheetName)


<#
Different methods are possible to retrieve the information from the sheet, I found the following ones:
#>

$worksheet.Range("C3").Text
$worksheet.Range("C3:C3").Text
$worksheet.Range("C3","C3").Text
$worksheet.cells.Item(3, 3).text
$worksheet.cells.Item(3, 3).value2
$worksheet.Columns.Item(3).Rows.Item(3).Text
$worksheet.Rows.Item(3).Columns.Item(3).Text
$worksheet.UsedRange.Range("c3").Text

<#
Finally we can create a PowerShell object to output the information we want to extract from the Excel file.
#>

$Output = [pscustomobject][ordered]@{
    ComputerName = $WorkSheet.Range("C3").Text
    Project = $WorkSheet.Range("C4").Text
    Ticket = $WorkSheet.Range("C5").Text
    Role = $WorkSheet.Range("C8").Text
    RoleType = $WorkSheet.Range("C9").Text
    Environment = $WorkSheet.Range("C10").Text
    Manufacturer = $WorkSheet.Range("C12").Text
    SiteCode = $WorkSheet.Range("C15").Text
    isDMZ = $WorkSheet.Range("C16").Text
    OperatingSystem = $WorkSheet.Range("C18").Text
    ServicePack = $WorkSheet.Range("C19").Text
    OSKey = $WorkSheet.Range("C20").Text
    Owner = $WorkSheet.Range("C22").Text
    MaintenanceWindow = $WorkSheet.Range("C23").Text
    NbOfProcessor = $WorkSheet.Range("C26").Text
    NbOfCores = $WorkSheet.Range("C27").Text
    MemoryGB = $WorkSheet.Range("C29").Text
}


<#
Script example
Here is an example with all the pieces together.
#>

#Specify the path of the excel file
$FilePath = "C:\LazyWinAdmin\VIDEOSERVER01-BuildSpecs.xlsx"

#Specify the Sheet name
$SheetName = "BuildSpecs"

# Create an Object Excel.Application using Com interface
$objExcel = New-Object -ComObject Excel.Application
# Disable the 'visible' property so the document won't open in excel
$objExcel.Visible = $false
# Open the Excel file and save it in $WorkBook
$WorkBook = $objExcel.Workbooks.Open($FilePath)
# Load the WorkSheet 'BuildSpecs'
$WorkSheet = $WorkBook.sheets.item($SheetName)

[pscustomobject][ordered]@{
    ComputerName = $WorkSheet.Range("C3").Text
    Project = $WorkSheet.Range("C4").Text
    Ticket = $WorkSheet.Range("C5").Text
    Role = $WorkSheet.Range("C8").Text
    RoleType = $WorkSheet.Range("C9").Text
    Environment = $WorkSheet.Range("C10").Text
    Manufacturer = $WorkSheet.Range("C12").Text
    SiteCode = $WorkSheet.Range("C15").Text
    isDMZ = $WorkSheet.Range("C16").Text
    OperatingSystem = $WorkSheet.Range("C18").Text
    ServicePack = $WorkSheet.Range("C19").Text
    OSKey = $WorkSheet.Range("C20").Text
    Owner = $WorkSheet.Range("C22").Text
    MaintenanceWindow = $WorkSheet.Range("C23").Text
    NbOfProcessor = $WorkSheet.Range("C26").Text
    NbOfCores = $WorkSheet.Range("C27").Text
    MemoryGB = $WorkSheet.Range("C29").Text
}



<#
http://mekalikot.blogspot.com/2014/08/read-and-get-values-from-excel-file.html
https://social.technet.microsoft.com/Forums/en-US/940d4ed1-fb8a-472c-abfd-2c1e946681da/powershell-excel-automation-dumping-text-content-into-single-text?forum=ITCG

#>

