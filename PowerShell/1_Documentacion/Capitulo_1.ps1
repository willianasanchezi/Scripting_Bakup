<#
Formularios
#>
using assembly System.Windows.Forms
using namespace System.Windows.Forms
$form = [Form] @{Text = 'Formulario'}
$button = [Button] @{Text = 'Push Me!'; 
Dock = 'Fill'
}
$button.add_Click{
$form.Close()
}
$form.Controls.Add($button)
$form.ShowDialog()

<#--------------------------------#>

<# Get-ChildItem -Recurse -Filter c*d.exe C:\Windows
Muestra archivo de los directorios y con el -Recurse muestra subdirectorios, en este caso se estan buscando 
los archivos *.exe
#>
Get-ChildItem -Recurse -Filter *.exe C:\Windows

<#--------------------------------#>

Clear-Host

<#--------------------------------#>
<#
Aca se esta buscando la palabra error en los archivo *.log que se encuentran en la carpeta Windows
#>
Get-ChildItem -Path $env:windir\*.log |
Select-String -List error |
Format-Table Path,LineNumber –AutoSize

<#--------------------------------#>
([xml] [System.Net.WebClient]::new().
DownloadString('http://blogs.msdn.com/powershell/rss.aspx')).
RSS.Channel.Item |
Format-Table title,link

<#--------------------------------#>

$files = Get-ChildItem
$files[1]

<#--------------------------------#>

Get-HotFix

<#--------------------------------#>

Get-ChildItem $PSHOME/*format* | Format-Table name

<#--------------------------------#>

Clear-Host
$rutaLog = "C:\TI\LogHash.log"
$listado = Get-childitem C:\TI\ -Recurse -include *.cab
Get-FileHash -Path $listado | Format-List | Out-File -FilePath $rutaLog -Append


<#--------------------------------#>

$myNewVariable = 'i exist'
Test-Path variable:myNewVariable

<#--------------------------------#>

${c:\windows\WindowsUpdate.log}.Length

<#--------------------------------#>

# Buscar cantidad de palabras en un archivo
# if
if (( Get-ChildItem *.txt | Select-String -List spam ).Length -eq 3)
{
'Spam! Spam! Spam!'
}

<#--------------------------------#>

# while
$val = 0
while($val -ne 3)
{
$val++
write-host "The number is $val"
}

<#--------------------------------#>

# do while
$val = 0
do
{
$val++
Write-Host "The number is $val"
} while ($val -ne 3)

<#--------------------------------#>

$val = 0
do {
$val++
Write-Host "The number is $val"
} until ($val -ge 3)


<#--------------------------------#>

for ($i=0; $i -lt 5; $i++) { $i }
for ($i=0; $($y = $i*2; $i -lt 5); $i++) { $y }


$l = 0; foreach ($f in Get-ChildItem *.txt) { $l += $f.length }
$l = 0; foreach ($f in Get-ChildItem c:\windows\WindowsUpdate.log) { $l += $f.length }


<#--------------------------------#>

# Busca 
switch -wildcard ('abc') {a* {'astar'} *c {'starc'} }

<#--------------------------------#>

switch -regex ('abc') {'(^A)(.*$)' {$matches}}

<#--------------------------------#>

# ForEach-Object with scriptblock
foreach ($f in Get-ChildItem *.txt) { $f.length }
Get-ChildItem *.txt | foreach-object {$_.length}

<#--------------------------------#>

<#
A function, at its simplest, is defined as follows:
function <name> {<statement list>}
A scriptblock, at its simplest, is defined like this:
{<statement list>}
#>
function hello { 'Hello world' }
hello

<#--------------------------------#>

function hello { "Hello there $args, how are you?" }
hello Willian

<#--------------------------------#>

# Both $args and $OFS are described in the help file about_Automatic_Variables .
function hello
{
$ofs=","
"Hello there $args and how are you?"
}
hello Bob Carol Ted Alice

<#--------------------------------#>

<#
function ql { $args }
function qs { "$args" }
#>

$col = "black","brown","red","orange","yellow","green","blue","violet","gray","white"
$col = ql black brown red orange yellow green blue violet gray white

$string = qs This is a
$string

<#--------------------------------#>

'"Hello world"' > hello.ps1
./hello.ps1

<#--------------------------------#>

# Autorizar uso de PowerShell como administrador
Start-Process –Verb runas –FilePath powershell.exe –ArgumentList 'Set-ExecutionPolicy –ExecutionPolicy RemoteSigned'

<#--------------------------------#>

workflow hello
{
'Hello World'
}
hello

<#--------------------------------#>

workflow test1
{
Get-CimInstance -ClassName Win32_ComputerSystem
}
test1

<#--------------------------------#>

# COM
$word = New-Object -ComObject 'Word.application'

<#--------------------------------#>

function Get-ProgId
{
param (
$filter = '.'
)
Get-ChildItem -Path 'REGISTRY::HKey_Classes_Root\clsid\*\progid' |
foreach {if ($_.name -match '\\ProgID$') { $_.GetValue('') }} |
Where-Object {$_ -match $filter}
}
Get-ProgId
Get-ProgId -filter internet
Get-ProgId -filter Word

<#--------------------------------#>

