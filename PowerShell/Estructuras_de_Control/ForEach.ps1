<#
About ForEach
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_foreach?view=powershell-5.1
foreach ($<item> in $<collection>){<statement list>}
#>


#foreach ($<item> in $<collection>){<statement list>}
#foreach ($letter in $letterArray){<statement list>}
$letterArray = "a","b","c","d"
foreach ($letter in $letterArray)
{
    Write-Host $letter
}


#
foreach ($file in Get-ChildItem)
{
    Write-Host $file
}


#
foreach ($file in Get-ChildItem)
{
    if ($file.length -gt 100KB)
    {
        Write-Host $file
    }
}

#
foreach ($file in Get-ChildItem)
{
    if ($file.length -gt 100KB)
    {
        Write-Host $file
        Write-Host $file.length
        Write-Host $file.lastaccesstime
    }
}

#
$i = 0
foreach ($file in Get-ChildItem) {
    if ($file.length -gt 100KB) {
        Write-Host $file "file size:" ($file.length / 1024).ToString("F0") KB
        $i = $i + 1
    }
}

if ($i -ne 0) {
    Write-Host
    Write-Host $i " file(s) over 100 KB in the current directory."
}
else {
    Write-Host "No files greater than 100 KB in the current directory."
}


#
($file.length / 1024).ToString("F0")

<#
About ForEach
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_foreach?view=powershell-5.1
<command> | foreach {<command_block>}
#>

Get-ChildItem | foreach {
    $fileCount = $directoryCount = 0
}{
    if ($_.PsIsContainer) {
        $directoryCount++
    } else {
        $fileCount++
    }
}{
    "$directoryCount directories and $fileCount files"
}


#
Get-ChildItem | foreach {
    $i = 0 } {
    if ($_.length -gt 10KB) {
        Write-Host $_.name "file size:" ($_.length / 1024).ToString("F0") KB
        $i++
    }
} {
    if ($i -ne 0) {
        Write-Host
        Write-Host "$i file(s) over 100 KB in the current directory."
    }
    else {
        Write-Host "No files greater than 100 KB in the current directory."
    }
}
