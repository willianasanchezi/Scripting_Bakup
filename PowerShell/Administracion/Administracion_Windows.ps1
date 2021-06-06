WinRM quickconfig
Set-ExecutionPolicy RemoteSigned

# Para conectarse se requiere
Puertos: 5985, 5986
Servicio: WinRM
Usuario con el que se conecta debe ser administrador del equipo
#

Ejecutar cmd desde PowerShell
cmd /c net localgroup administrators

<# Puertos conexion remota
https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/winrmsecurity?view=powershell-7.1
tcp/5985 y tcp/5986
#>
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/?view=powershell-5.1
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-5.1
# Windows Servicios de Componentes
# Component Services Administration
# https://technet.microsoft.com/en-us/library/cc731901(v=ws.11).aspx
# Introducción a la administración de Servicios de componentes
# https://technet.microsoft.com/es-es/library/cc772579(v=ws.11).aspx

WinRM quickconfig # Habilitar PowerShell Remoto
Invoke-Item "C:\Windows\ImmersiveControlPanel\SystemSettings.exe" # Abrir Panel de Control
command # Comandos de PowerShell
get-help Copy-Item # Ayuda
Get-Service | Get-Member # Detalle
Start-Process powershell -Verb runAs #Runas
# http://bytesentreteclas.com/habilitar-ejecucion-de-scripts-powershell-en-windows-10/
Set-ExecutionPolicy RemoteSigned # Habilitar PowerShell Windows 7
Start-Process PowerShell_ISE -Verb RunAs # Ejecutar como administrador

##
Get-Service | clip
Test-NetConnection violeta.mincomunicaciones.gov.co -port 445

Get-NetIPAddress

Copy-Item Z:\JupiterNotebook\*.* E:\Sync\Desarrollo\JupiterNotebook
Get-ChildItem E:\Sync\Desarrollo\JupiterNotebook

<# Test puertos #>
Clear-Host
$puertos = @(135, 139, 445)
For ($i=0; $i -lt $puertos.Length; $i++){
    $resultado = Test-NetConnection curcuma.mintic.gov.co -port $puertos[$i]
    $resultado
}


<# Test puertos desde archivo de texto #>
Clear-Host



$puertos = @(135, 139, 445)
For ($i=0; $i -lt $puertos.Length; $i++){
    $resultado = Test-NetConnection curcuma.mintic.gov.co -port $puertos[$i]
    $resultado
}



<# Inicio for anidado #>

Clear-Host
$servidores = @("CURCUMA.mintic.gov.co","violeta.mincomunicaciones.gov.co")
$puertos = @(135, 139, 445)
For ($i=0; $i -lt $servidores.Length; $i++){
    For ($j=0; $j -lt $puertos.Length; $j++){
    $resultado = Test-NetConnection $servidores[$i] -port $puertos[$j]
    $resultado 
    }
}

<# Fin for anidado #>

Test-NetConnection curcuma.mintic.gov.co -port 445

# Ping Masivo
<# Puertos Compartir archivos e impresoras 135, 139, 445 #>
Clear-Host
$servidores = @("ENELDO.mincomunicaciones.gov.co","CILANTRO.mintic.gov.co",
"PALIURE.mintic.gov.co",
"doradilla.mintic.gov.co",
"TIBUCHINA.mintic.gov.co",
"DUBOISIA.mintic.gov.co",
"SRV-SSRS1.mintic.gov.co",
"SRV-SSIS1.mintic.gov.co",
"SRV-SSAS1.mintic.gov.co")
For ($i=0; $i -lt $servidores.Length; $i++) {
    $resultado = Test-Connection $servidores[$i]
    $servidores[$i], $resultado
    }

# Puertos para acceder por PS Remoto 5985/tcp y 5986/tcp

<# Test puerto base de datos #>

Clear-Host
$servidores = @("templaurela.mincomunicaciones.gov.co","AJEDREA.mintic.gov.co",
"DROSERA.mintic.gov.co")
For ($i=0; $i -lt $servidores.Length; $i++) {
    $resultado = Test-NetConnection $servidores[$i] -Port 1433
    $servidores[$i], $resultado
    }

<##>

Get-ADComputer -Filter *

Get-Service | Get-Member
Get-Service | Group-Object -Property Status
Get-Service | Group-Object -Property DisplayName
Get-Service | Select *
Get-Service | Where-Object {$_.Status -eq "Running"}
Get-Service | Where Status -eq "Running"
Get-Service | Where-Object {$_.DisplayName -eq "Windows Time"}
Get-Service | Where-Object name -Like *term*
Get-Service | Where-Object name -Like "*term*"
Get-Service | where Status -eq "Stopped"

# Autorizar uso de PowerShell como administrador
Start-Process –Verb runas –FilePath powershell.exe –ArgumentList 'Set-ExecutionPolicy –ExecutionPolicy RemoteSigned'

# Export
command  | Export-Csv -Path F:\comandos.csv -Encoding ascii -NoTypeInformation

# Version PowerShell
get-host
# Pipeline |
# salida, condicion
get-service | select name

#Verbo(accion) -Objeto
# Comandlet
Get
Set
New
Add
Remove
Modify
Stop
Start
Restart

# String
StdIn
StdOut
StdWarning
StdError
StdDebug

<# 
Operadores

Powershell uses the ! character as an alias for the logical -not operator.

$true es igual a True
!$true es igual a False 
$false es igual a False
!$false es igual a True

#>

#
$entrada = Read-Host
Write-Host $entrada

# Pilares Porgramacion Orientada a Objetos
# Clases, Objetos, Atributos, Argumentos, Metodos
get-services
# Cada servicio es un objeto
get-service | Get-Member
# Alias
get-service | gm
# Todos los alias
Get-Alias

# La salida del comando1 se la envia al comando2
# comando1 1 | comando2
# Se llama a los objetos $_.
# Se llama objeto y la propiedad $_.Name
Get-Content c:\listado.txt | %{Write-Host -ForegroundColor Green $_.} 

# Conectarse a un servidor con PowerShell
Enter-PSSession 'eneldo.mincomunicaciones.gov.co' -Credential:'mincom\scsmadm'
Enter-PSSession 'PAAD2714.mintic.gov.co' -Credential:'mintic\usr.sccmadm'


# Listar Clases
Get-SCSMClass | Out-GridView
Get-WmiObject -Class Win32_LogicalDisk | Out-GridView

# Tamaño discos
Get-Disk
Get-volume

#Unidades de Red
Get-PSDrive

# Clases de LogicalDisk
Get-WmiObject -Class Win32_LogicalDisk | Out-GridView
Get-WMIObject  -Class Win32_LogicalDisk

# Ejecutar 2 comandos en una linea
Get-Service;Get-Process
<#
Administrar ubicacion
https://technet.microsoft.com/es-es/library/dd315262.aspx
#>
Get-Location
Set-Location D:
<#
Crear nuevo archivo o carpeta
https://technet.microsoft.com/en-us/library/ee176914.aspx
#>
New-Item c:\scripts\new_file.txt -type file
<#
Adicionar texto a unarchivo
https://technet.microsoft.com/en-us/library/ee156791.aspx
#>
Add-Content c:\scripts\test.txt "The End"
Add-Content c:\scripts\test.txt "GR387953"
<#
Borrar contenido de un archivo
https://technet.microsoft.com/en-us/library/ee156808.aspx
#>
Clear-Content .\listado.txt
<#
Ver texto de un archivo
#>
Get-Content .\listado.txt
<#
Eliminar archivos
https://technet.microsoft.com/en-us/library/ee176938.aspx
#>
Remove-Item c:\scripts\test.txt
Remove-Item C:\Users\admincoem\AppData\Local\Temp\ -Recurse
Remove-Item C:\Windows\Temp\ -Recurse
<#
Listado de servicios que se estan ejecutando
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-service?view=powershell-5.1
#>
Get-Service | Where-Object {$_.Status -eq "Running"}
Get-Service
Get-Service "wmi*"
Get-Service -Displayname "*network*"
Get-Service -Name "win*" -Exclude "WinRM"
Get-Service | Where-Object {$_.Status -eq "Running"}
Get-Service -ComputerName "Server02"
Get-Service | Where-Object {$_.DependentServices} | Format-List -Property Name, DependentServices, @{Label="NoOfDependentServices"; Expression={$_.dependentservices.count}}
Get-Service "s*" | Sort-Object status
Get-Service "s*" | Sort-Object status -Descending
Get-Service -Name "WinRM" -ComputerName "localhost", "Server01", "Server02" | Format-Table -Property MachineName, Status, Name, DisplayName -auto
Get-Service "WinRM" -RequiredServices
"WinRM" | Get-Service
<# 
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-5.1
Parametros Where-Object EQ, CEQ, NE, CNE, GT, CGT, LT, CLT, GE, CGE, LE, CLE, Like, 
CLike, NotLike, CNotLike, Match, CMatch, NotMatch, CNotMatch, Contains, CContains,
NotContains, CNotContains, In, CIn, NotIn, Is, IsNot, Verbose 
#>
Get-Service | Where-Object name -Like *term*
Get-Service | Where-Object {$_.Status -eq "Stopped"}
Get-Service | where Status -eq "Stopped"


# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/Stop-Service?view=powershell-5.1
# Stop-Service
Stop-Service -Name "sysmonlog"
Get-Service -DisplayName "telnet" | Stop-Service
Get-Service -Name "iisadmin" | Format-List -Property Name, DependentServices
Stop-Service -Name "iisadmin" -Force -Confirm

# Procesos
Get-Process | Where-Object {$_.ProcessName -eq "wscript"} | Format-Table -Property Name, Description, Responding, starttime
Get-Process | Where-Object {$_.ProcessName -eq "WakeOnLAN"} | Format-Table -Property Name, Description, Responding, StartTime


<# 
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-psdrive?view=powershell-5.1
Unidades de Red
#>
Get-PSDrive
# Conectar Unidad de Red
New-PSSession -ComputerName "curcuma.mintic.gov.co" -Credential "mintic\usr.sccmadm"
New-PSDrive -Name "P" -PSProvider "FileSystem" -Root "\\Server01\Public"

<#
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/copy-item?view=powershell-5.1
Copiar Archivos
#>
Copy-Item


# Abrir IE
Invoke-Item "C:\Program Files\Internet Explorer\iexplore.exe"

# Abrir URL utilizando com (Servicios de Componentes)
$navegador=new-object -com internetexplorer.application
$navegador.navigate2("https://www.yourURL.com")
$navegador.visible=$true

<#
Conectar Unidad de Red
$unidad = New-Object -ComObject wscript.network
$unidad | Get-Member
#>
$unidad = New-Object -ComObject wscript.network
$unidad.MapNetworkDrive("Z:","\\curcuma.mintic.gov.co\Software_library", $false, "mintic\wsanchez", "")

#
###

<#
Operaciones Logicas
-ne "Not Equal"
-like "Like"
-gt "Greater Than"
-eq "Equal"

Operaciones Iterativas
#>
1 -gt 2 # 1 mayor que 2

<#
Operaciones Logicas de verificacion
if else
where
swicth

ctrl + j
Editar / Iniciar Fragmetos de codigo
#>

# where
Get-Content c:\Listado.txt | Where-Object{$_ -eq "google" -and $_ -eq "tiempo"}

# switch
$mivalor = 3
switch($mivalor)
{
    1 {Write-Output "Es uno"}
    2 {Write-Output "Es dos"}
    3 {Write-Output "Es uno"}
    default {"No hay numero"}
}

<#
ScriptBlock

#>


<# 
Procesos
Get-Process
Get-Process | Get-Member
En esta linea se estan filtrando los proceos que consumen ma
#>
Get-Process | Where-Object {$_.CPU -gt 10}

# Buscar archivos por extension 
Get-ChildItem -Path C:\ -Recurse -Filter *.iso
Get-ChildItem -Path F:\ -Recurse -Filter *.iso
# Listado de archivos de una carpeta
Get-ChildItem C:\Windows\Temp\ 
# Listado de archivos de una carpeta mayores a 5 KB (5000)
Get-ChildItem C:\Windows\Temp\ | Where-Object {$_.Length -gt 5000}
# Listado de archivos de una carpeta mayores a 10 MB (10000000), 10 MB son 10 millones 
Get-ChildItem C:\Windows\Temp\ | Where-Object {$_.Length -gt 10000000}

<# Ejecutar test de puerto masivo #>
$reader = [System.IO.File]::OpenText("C:\TI\listado.txt")
try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        # Proceso de test
        Test-NetConnection $line -port 80
        $line
     }
}
finally 
{
    $reader.Close()
}
<##>


<# Test URL 
https://www.petri.com/testing-uris-urls-powershell
#>
$url = "http://subsidios.mintic.gov.co/admin/login"
Invoke-WebRequest $url -UseBasicParsing -Method Head
<##>

<# Test URL #>
$url = "http://enula/webkactus/"
Invoke-WebRequest $url -UseBasicParsing -Method Get -Credential mincom\wsanchez

$url = "http://templaurel/Reports_SMDATAWAREHOUSE/Pages/Report.aspx?ItemPath=%2fSystemCenter%2fServiceManager%2fConsultas%2fSCSMEstadoPlataforma"
Invoke-WebRequest $url -UseBasicParsing -Method Get -Credential mincom\wsanchez

$url = "http://templaurel/Reports_SMDATAWAREHOUSE/Pages/Report.aspx?ItemPath=%2fSystemCenter%2fServiceManager%2fConsultas%2fSCSMEstadoPlataforma"
Invoke-WebRequest $url -Method Get -Credential mincom\scsmadm
<##>

<# Conectarse a un equipo por PS #>
Enter-PSSession 'sauco.mintic.gov.co' -Credential:'minitc\usr.sccmadm'
<##>

<# Ejecutar test de URL Masivo #>
$reader = [System.IO.File]::OpenText("C:\TI\listado.txt")
try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        # Proceso de test
        Invoke-WebRequest $line -UseBasicParsing -Method Head
        $line
     }
}
finally 
{
    $reader.Close()
}
<##>

<# Servicio equipo remoto #>
Get-Service -ComputerName 172.27.4.70 | Where-Object {$_.Name -eq "ccmexec"}
Get-Service -ComputerName DMOFTIVIRTUAL | Where-Object {$_.Name -eq "ccmexec"}
<##>


Get-FileHash -Path F:\rptResolucionesMulta_01012010-01082017.xlsx -Algorithm SHA256 | Out-GridView

# Instalar aplicaciones
Install-Package -Name “.\GoogleEarthPro.msi”

# Listado de Aplicaciones Instaladas
Get-WmiObject -Class Win32_Product | Select-Object -Property Name

# Trabajar con impresoras
# https://docs.microsoft.com/es-es/powershell/scripting/getting-started/cookbooks/working-with-printers?view=powershell-5.1

(New-Object -ComObject WScript.Network).RemovePrinterConnection("\\172.23.24.180\Prueba PaperCut")
(New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\172.23.24.180\Prueba PaperCut")
Get-WmiObject -Class Win32_Printer

# Trabajar con archivos y carpetas
# https://docs.microsoft.com/es-es/powershell/scripting/getting-started/cookbooks/working-with-files-and-folders?view=powershell-5.1 

# Remote Server Administration Tools for Windows 8.1
# https://www.microsoft.com/en-us/download/details.aspx?id=39296

# Trabajar con instalaciones de software
# https://docs.microsoft.com/es-es/powershell/scripting/getting-started/cookbooks/working-with-software-installations?view=powershell-5.1



# Remote Server Administration Tools for Windows 10
# https://www.microsoft.com/en-us/download/confirmation.aspx?id=45520

# Install or Uninstall Roles, Role Services, or Features
# https://docs.microsoft.com/en-us/windows-server/administration/server-manager/install-or-uninstall-roles-role-services-or-features

# Install or Uninstall Roles, Role Services, or Features
# https://docs.microsoft.com/en-us/windows-server/administration/server-manager/install-or-uninstall-roles-role-services-or-features


# https://technet.microsoft.com/en-us/library/dn249523(v=wps.630).aspx

<#
Colocar titulo en la ventana
https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/30/powertip-change-the-powershell-console-title/
#>
$host.ui.RawUI.WindowTitle = "Changed Title"

<#
Modulos
http://freyes.svetlian.com/Modulos.htm
Domina la powershell - Parte 8 - Como crear, y usar módulos en la Poweshell
https://www.youtube.com/watch?v=vFctB2O2IOI
#>


<# Visor de Eventos #>
Invoke-Command -ComputerName balsamo.mincomunicaciones.gov.co -FilePath E:\Sync\Scripting\PowerShell\Administracion\EventLogs.ps1
<##>

<# Copy EventLogs #>
Test-Path \\balsamo.mincomunicaciones.gov.co\c$
Get-Item \\balsamo.mincomunicaciones.gov.co\c$\Windows\System32\winevt\Logs\*
robocopy \\balsamo.mincomunicaciones.gov.co\c$\Windows\System32\winevt\Logs\ E:\Logs\Balsamo\Logs_BALSAMO_evtx /e /v /R:5 /W:9 /LOG:E:\Logs\Copy_Logs_BALSAMO_evtx_110420181036.log
Test-Path F:\Logs\Logs_BALSAMO_csv\
Get-Item F:\Logs\Logs_BALSAMO_csv\*
Remove-Item F:\Logs\Logs_BALSAMO_csv\*
Get-Item E:\Logs\Balsamo\Logs_BALSAMO_evtx\*
Get-WinEvent -Path E:\Logs\Balsamo\Logs_BALSAMO_evtx\Application.evtx | Export-Csv -Path F:\Logs\Logs_BALSAMO_csv\Application.csv -NoTypeInformation
Get-WinEvent -Path E:\Logs\Balsamo\Logs_BALSAMO_evtx\System.evtx | Export-Csv -LiteralPath F:\Logs\Logs_BALSAMO_csv\System.csv -NoTypeInformation
<##>

<# Copy Logs SCCM #>
Test-Path '\\balsamo.mincomunicaciones.gov.co\c$\Windows\CCM\Logs'
robocopy \\balsamo.mincomunicaciones.gov.co\c$\Windows\CCM\Logs\ E:\Logs\Balsamo\Logs_BALSAMO_sccm /e /v /R:5 /W:9 /LOG:E:\Logs\Copy_Logs_BALSAMO_sccm_110420181105.log
<##>

<# Copy EventLogs #>
Clear-Host
$servidor1 = "balsamo"
$servidor2 = ".mincomunicaciones.gov.co"
$servidor3 = $servidor1 + $servidor2
$directorio1 = $servidor1 + "_evtx"
$directorio2 = $servidor1 + "_csv"
$logs1 = $servidor1 + "_evtx_170420181648"
Write-Host $servidor3
Write-Host $directorio1
Write-Host $directorio2
Write-Host $logs1

Test-Path \\$servidor3\c$
Get-Item \\$servidor3\c$\Windows\System32\winevt\Logs\*
Test-Path E:\Logs\$servidor1\
New-Item -Path "E:\Logs\" -Name "$servidor1" -ItemType "directory"
robocopy \\$servidor3\c$\Windows\System32\winevt\Logs\ E:\Logs\$servidor1\Logs_$directorio1 /e /v /R:5 /W:9 /LOG:E:\Logs\Copy_Logs_$logs1.log

Test-Path F:\Logs\Logs_$directorio2\
New-Item -Path "F:\Logs\" -Name "Logs_$directorio2" -ItemType "directory"

Get-Item F:\Logs\Logs_$directorio2\*
Remove-Item F:\Logs\Logs_$directorio2\*
Get-Item E:\Logs\$servidor1\Logs_$directorio1\*
Get-WinEvent -Path E:\Logs\$servidor1\Logs_$directorio1\Application.evtx | Export-Csv -Path F:\Logs\Logs_$directorio2\Application.csv -NoTypeInformation
Get-WinEvent -Path E:\Logs\$servidor1\Logs_$directorio1\System.evtx | Export-Csv -LiteralPath F:\Logs\Logs_$directorio2\System.csv -NoTypeInformation
<##>

Invoke-Command -ComputerName curcuma.mintic.gov.co {ping maiz}
Invoke-Command -ComputerName curcuma.mintic.gov.co {Test-Path \\maiz\PCClient}


<# Hash #>
Get-FileHash -Path E:\Trabajo\SM\MP\MINTIC\IN\MINTICIncidentesPlantillas\Base\ManagementPack.08fbb64dad3a43c8a77a1a5aceba68c0.xml -Algorithm SHA256

<#
Contar archivos
#>
Get-ChildItem | Measure-Object | %{$_.Count}
Get-ChildItem -Recurse | Measure-Object | %{$_.Count}
Get-ChildItem -Recurse -Directory | Measure-Object | %{$_.Count}
Get-ChildItem -Recurse -File | Measure-Object | %{$_.Count}

<#
Workflow
#>
Workflow Test-Runbook
{
    Parallel
    {
    ping 127.0.0.1
    ping 127.0.0.2

    Sequence
    {
    ping 127.0.0.3
    ping 127.0.0.4
    }
    }
    get-date
}
Test-Runbook

<# Software Instalado #>
gwmi  Win32_Product
gp HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | ? {![string]::IsNullOrWhiteSpace($_.DisplayName) } | select DisplayName
Get-WmiObject -Class Win32_Product | Select-Object -Property Name
