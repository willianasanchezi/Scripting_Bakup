<#Version#>
$PSVersionTable
<#
Puertos
https://docs.microsoft.com/es-es/powershell/scripting/learn/remoting/winrmsecurity?view=powershell-7.1
#>

<#
Versión del sistema operativo Windows	Directiva de ejecución predeterminada
Server 2019	Remota firmada
Server 2016	Remota firmada
Windows 10	Restringido
#>
Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

<# 
https://docs.microsoft.com/es-es/powershell/scripting/samples/viewing-object-structure--get-member-?view=powershell-7.1
Ver la estructura del objeto (Get-Member)
#>
Get-Process | Get-Member
Get-Process | Get-Member | Out-Host -Paging
Get-Process | Get-Member -MemberType Properties

<# 
Seleccionar partes de objetos (Select-Object)
#>
Get-CimInstance -Class Win32_LogicalDisk | Select-Object -Property Name,FreeSpace
Get-Volume | Select-Object -Property DriveLetter,SizeRemaining,Size

# Con Select-Object, puede crear propiedades calculadas. Por lo tanto, puede mostrar FreeSpace en gigabytes en lugar de en bytes.
Get-CimInstance -Class Win32_LogicalDisk |
  Select-Object -Property Name, @{
    label='FreeSpace'
    expression={($_.FreeSpace/1GB).ToString('F2')}
  }

<#
Quitar objetos de la canalización (Where-Object)
Operadores de comparación	Significado	Ejemplo (devuelve true)
-eq	es igual a	1 -eq 1
-ne	No es igual a	1 -ne 2
-lt	Es menor que	1 -lt 2
-le	Es menor o igual que	1 -le 2
-gt	Es mayor que	2 -gt 1
-ge	Es mayor o igual que	2 -ge 1
-like	Es como (comparación de comodín para texto)	"file.doc" -like "f*.do?"
-notlike	No es como (comparación de comodín para texto)	"file.doc" -notlike "p*.doc"
-contains	Contiene	1,2,3 -contains 1
-notcontains	No contiene	1,2,3 -notcontains 4


Los operadores lógicos estándar se muestran en la tabla siguiente.
TABLA 2
Operador lógico	Significado	Ejemplo (devuelve true)
-and	Lógico and; true si ambos lados son true	(1 -eq 1) -and (2 -eq 2)
, o	Lógico or; true si algún lado es true	(1 -eq 1) -or (1 -eq 2)
-not	Lógico not; invierte true y false	-not (1 -eq 2)
!	Lógico not; invierte true y false	!(1 -eq 2)
#>

1,2,3,4 | Where-Object {$_ -lt 3}
# Controladores que se estan ejecutando
Get-CimInstance -Class Win32_SystemDriver | Where-Object {$_.State -eq 'Running'}
#
Get-CimInstance -Class Win32_SystemDriver |
  Where-Object {$_.State -eq "Running"} |
    Where-Object {$_.StartMode -eq "Auto"}
#
Get-CimInstance -Class Win32_SystemDriver |
  Where-Object {$_.State -eq "Running"} |
    Where-Object {$_.StartMode -eq "Manual"} |
      Format-Table -Property Name,DisplayName
#
Get-CimInstance -Class Win32_SystemDriver |
  Where-Object {($_.State -eq 'Running') -and ($_.StartMode -eq 'Manual')} |
    Format-Table -Property Name,DisplayName

<#
Ordenar objetos
#>
Get-ChildItem |
  Sort-Object -Property LastWriteTime, Name |
  Format-Table -Property LastWriteTime, Name
#
Get-ChildItem |
  Sort-Object -Property LastWriteTime, Name -Descending |
  Format-Table -Property LastWriteTime, Name
# Uso de las tablas hash
Get-ChildItem |
  Sort-Object -Property @{ Expression = 'LastWriteTime'; Descending = $true }, @{ Expression = 'Name'; Ascending = $true } |
  Format-Table -Property LastWriteTime, Name
# El ejemplo siguiente ordena los objetos en orden descendente según el intervalo de tiempo entre CreationTime y LastWriteTime
Get-ChildItem |
  Sort-Object -Property @{ Expression = { $_.LastWriteTime - $_.CreationTime }; Descending = $true } |
  Format-Table -Property LastWriteTime, CreationTime

## Sugerencias
# Puede omitir el nombre de parámetro Property del modo siguiente:
Sort-Object LastWriteTime, Name
# Además, puede hacer referencia a Sort-Object mediante su alias integrado, sort:
sort LastWriteTime, Name
# Las claves de las tablas hash para la ordenación se pueden abreviar como sigue:
Sort-Object @{ e = 'LastWriteTime'; d = $true }, @{ e = 'Name'; a = $true }
# En este ejemplo, e significa Expression , d significa Descending y a significa Ascending .
# Para mejorar la legibilidad, puede colocar las tablas hash en una variable independiente:
$order = @(
  @{ Expression = 'LastWriteTime'; Descending = $true }
  @{ Expression = 'Name'; Ascending = $true }
)

Get-ChildItem |
  Sort-Object $order |
  Format-Table LastWriteTime, Name

<#
https://docs.microsoft.com/es-es/powershell/module/microsoft.powershell.core/foreach-object?view=powershell-7.1
ForEach-Object
#>

# Example 1: Divide integers in an array
# This example takes an array of three integers and divides each one of them by 1024.
30000, 56798, 12432 | ForEach-Object -Process {$_/1024}

# Example 2: Get the length of all the files in a directory
# This example processes the files and directories in the PowerShell installation directory $PSHOME.
Get-ChildItem $PSHOME |
  ForEach-Object -Process {if (!$_.PSIsContainer) {$_.Name; $_.Length / 1024; " " }}

# Ejemplo 3: operar en los eventos del sistema más recientes
# Este ejemplo escribe los 1000 eventos más recientes del registro de eventos del sistema en un archivo de texto. La hora actual se muestra antes y después de procesar los eventos.
$Events = Get-EventLog -LogName System -Newest 100
$events | ForEach-Object -Begin {Get-Date} -Process {Out-File -FilePath Events.txt -Append -InputObject $_.Message} -End {Get-Date}

# Ejemplo 4: cambiar el valor de una clave de registro
# Este ejemplo cambia el valor de la entrada de registro RemotePath en todas las subclaves bajo HKCU:\Netwkork Key a texto en mayúsculas.
Get-ItemProperty -Path HKCU:\Network\* |
  ForEach-Object {Set-ItemProperty -Path $_.PSPath -Name RemotePath -Value $_.RemotePath.ToUpper();}

# This example shows the effect of piping the $Null automatic variable to the ForEach-Object cmdlet.
1, 2, $null, 4 | ForEach-Object {"Hello"}

# Este ejemplo obtiene el valor de la propiedad Path de todos los módulos de PowerShell instalados mediante el parámetro MemberName del cmdlet ForEach-Object.
Get-Module -ListAvailable | ForEach-Object -MemberName Path
Get-Module -ListAvailable | Foreach Path

# Ejemplo 7: dividir los nombres de los módulos en los nombres de los componentes
# Este ejemplo muestra tres formas de dividir dos nombres de módulos separados por puntos en sus nombres de componentes.
"Microsoft.PowerShell.Core", "Microsoft.PowerShell.Host" | ForEach-Object {$_.Split(".")}
"Microsoft.PowerShell.Core", "Microsoft.PowerShell.Host" | ForEach-Object -MemberName Split -ArgumentList "."
"Microsoft.PowerShell.Core", "Microsoft.PowerShell.Host" | Foreach Split "."

# Example 8: Using ForEach-Object with two script blocks
# Ejemplo 8: uso de ForEach-Object con dos bloques de script
# En este ejemplo, pasamos dos bloques de script posicionalmente. Todos los bloques de secuencia de comandos se vinculan al parámetro de proceso. Sin embargo, se tratan como si se hubieran pasado a los parámetros Comenzar y Procesar.
1..2 | ForEach-Object { 'begin' } { 'process' }

# Example 9: Using ForEach-Object with more than two script blocks
# In this example, we pass two script blocks positionally. All the script blocks bind to the Process parameter. However, they are treated as if they had been passed to the Begin, Process, and End parameters.
1..2 | ForEach-Object { 'begin' } { 'process A' }  { 'process B' }  { 'end' }
1 | ForEach-Object { Test-NetConnection 127.0.0.1 } { Test-NetConnection 127.0.0.2 }

# Example 10: Run multiple script blocks for each pipeline item
# As shown in the previous example, multiple script blocks passed using the Process parameter get mapped to the Begin and End parameters. To avoid this mapping, you must provide explicit values for the Begin and End parameters.
1..2 | ForEach-Object -Begin $null -Process { 'one' }, { 'two' }, { 'three' } -End $null

<#
https://docs.microsoft.com/es-es/powershell/scripting/samples/creating-.net-and-com-objects--new-object-?view=powershell-7.1
Crear objetos .NET y COM (New-Object)
#>

# Usar Internet Explorer desde Windows PowerShell
$ie = New-Object -ComObject InternetExplorer.Application
$ie | Get-Member
$ie.Visible = $true
$ie.Navigate("https://devblogs.microsoft.com/scripting/")
$ie.Document.Body.InnerText
$ie.Quit()
Remove-Variable ie

<#
Usar métodos y clases estáticas
No todas las clases de .NET Framework se pueden crear mediante New-Object . Por ejemplo, si intenta crear un objeto System.Environment o System.Math con New-Object , obtendrá los siguientes mensajes de error
#>
[System.Environment]
[System.Math]
[System.Environment] | Get-Member
[System.Environment] | Get-Member -Static
[System.Environment]::Commandline
[System.Environment]::OSVersion
[System.Environment]::UserName
# Para comprobar si el equipo se está apagando, podemos mostrar la propiedad HasShutdownStarted
[System.Environment]::HasShutdownStarted

[System.Math] | Get-Member -Static -MemberType Methods

[System.IO.File]::OpenText("E:\ConfigMgr\img\list.txt")

<#
Obtener objetos de WMI (Get-CimInstance)
#>
# lista de las clases WMI disponibles en el equipo local
Get-CimClass -Namespace root/CIMV2 |
  Where-Object CimClassName -like Win32* |
    Select-Object CimClassName

# Puede recuperar la misma información de un equipo remoto mediante el parámetro ComputerName
Get-CimClass -Namespace root/CIMV2 -ComputerName 192.168.1.29
#
Get-CimInstance -Class Win32_OperatingSystem
#
Get-CimInstance Win32_OperatingSystem
#
Get-CimInstance -Class Win32_OperatingSystem | Get-Member -MemberType Property
#
Get-CimInstance -Class Win32_OperatingSystem |
  Format-Table -Property TotalVirtualMemorySize, TotalVisibleMemorySize,
    FreePhysicalMemory, FreeVirtualMemory, FreeSpaceInPagingFiles
#
Get-CimInstance -Class Win32_OperatingSystem | Format-List Total*Memory*, Free*

<#
Manipular elementos directamente
Archivos, Carpetas
#>
# El resultado del comando Get-Command -Noun Item indica que hay nueve cmdlets de elemento en Windows PowerShell
Get-Command -Noun Item

# Crear directorio
New-Item -Path c:\temp\Directory -ItemType Directory
# Crear archivo
New-Item -Path C:\temp\Directory\file1.txt -ItemType file
# Crear llave de registro
New-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion_Test
# Renombra
Rename-Item -Path C:\temp\Directory\file1.txt fileOne.txt
# Por ejemplo, el siguiente comando mueve el directorio New.Directory del directorio C:\temp a la raíz de la unidad C:. Para confirmar que el elemento se ha movido, incluya el parámetro PassThru del cmdlet Move-Item . Sin Passthru , el cmdlet Move-Item no muestra ningún resultado.
Move-Item -Path C:\temp\Directory -Destination C:\ -PassThru
# Copiar
Copy-Item -Path C:\Directory -Destination C:\temp
Copy-Item -Path C:\Directory -Destination C:\temp -Recurse -Force -Passthru
# Eliminar
Remove-Item C:\Directory
Remove-Item C:\temp\New.Directory -Recurse
# Ejecutar elementos (Invoke-Item)
Invoke-Item C:\WINDOWS

<#
https://docs.microsoft.com/es-es/powershell/scripting/samples/other-useful-scripting-objects?view=powershell-7.1
Existen algunas limitaciones sobre cómo Windows PowerShell ISE interactúa con las aplicaciones de consola. Un comando o un script de automatización que requiere la intervención de usuario podrían no funcionar de la misma forma que desde la consola de Windows PowerShell. Puede bloquear la ejecución de estos comandos o scripts en el panel de comandos de Windows PowerShell ISE. El objeto $psUnsupportedConsoleApplications mantiene una lista de estos comandos. Si intenta ejecutar los comandos de esta lista, recibirá un mensaje donde se indica que no son compatibles. El siguiente script agrega una entrada a la lista.
#>

<#
https://docs.microsoft.com/es-es/powershell/scripting/learn/deep-dives/write-progress-across-multiple-threads?view=powershell-7.1
Escritura de Progress en varios subprocesos con Foreach Parallel
#>

while($job.State -eq 'Running')
{
    $sync.Keys | Foreach-Object {
        # If key is not defined, ignore
        if(![string]::IsNullOrEmpty($sync.$_.keys))
        {
            # Create parameter hashtable to splat
            $param = $sync.$_

            # Execute Write-Progress
            Write-Progress @param
        }
    }

    # Wait to refresh to not overload gui
    Start-Sleep -Seconds 0.1
}

<#
https://docs.microsoft.com/es-es/powershell/scripting/learn/deep-dives/add-credentials-to-powershell-functions?view=powershell-7.1
Compatibilidad para agregar credenciales a funciones de PowerShell
#>

$Cred = Get-Credential
$Cred = Get-Credential -Credential domain\user
$Cred = Get-Credential -UserName domain\user -Message 'Enter Password'
# 
ConvertTo-SecureString "MyPlainTextPassword" -AsPlainText -Force
# Se requieren los parámetros AsPlainText y Force. Sin esos parámetros, recibirá un mensaje advirtiendo que no debe pasar texto sin formato a una cadena segura. PowerShell devuelve esta advertencia porque la contraseña de texto sin formato se registra en varios registros. Una vez que haya creado una cadena segura, deberá pasarla al método PSCredential() para crear el objeto de credencial. En el ejemplo siguiente, la variable $password contiene la cadena segura $Cred que contiene el objeto de credencial.
$password = ConvertTo-SecureString "MyPlainTextPassword" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ("username", $password)
#


<#
https://docs.microsoft.com/es-es/powershell/scripting/learn/remoting/running-remote-commands?view=powershell-7.1
Ejecutar comandos remotos
#>

# Comunicación remota de Windows PowerShell sin configuración
# Muchos de los cmdlets de Windows PowerShell tienen un parámetro ComputerName que les permite recopilar datos y cambiar la configuración de uno o más equipos remotos. Estos cmdlets utilizan diversos protocolos de comunicación y funcionan en todos los sistemas operativos Windows sin ninguna configuración especial.
# Estos cmdlets son:

Restart-Computer
Test-Connection
Clear-EventLog
Get-EventLog
Get-HotFix
Get-Process
Get-Service
Set-Service
Get-WinEvent
Get-WmiObject

Get-Command | where { $_.parameters.keys -contains "ComputerName" -and $_.parameters.keys -notcontains "Session"}
# Iniciar una sesión interactiva
Enter-PSSession Server01
Exit-PSSession
# Ejecutar un comando remoto
Invoke-Command -ComputerName Server01, Server02 -ScriptBlock {Get-UICulture}
# Ejecutar un script
Invoke-Command -ComputerName Server01, Server02 -FilePath c:\Scripts\DiskCollect.ps1
# Establecer conexion persistente 
$s = New-PSSession -ComputerName Server01, Server02
Invoke-Command -Session $s {$h = Get-HotFix}

<#
Realizar el segundo salto en la comunicación remota de PowerShell
https://docs.microsoft.com/es-es/powershell/scripting/learn/remoting/ps-remoting-second-hop?view=powershell-7.1
#>

<#
https://docs.microsoft.com/es-es/powershell/scripting/samples/changing-computer-state?view=powershell-7.1
Cambiar el estado del equipo
#>
# Bloquear un equipo
rundll32.exe user32.dll,LockWorkStation

# Cerrar la sesión actual
logoff
shutdown.exe -l
Get-CimInstance -Classname Win32_OperatingSystem | Invoke-CimMethod -MethodName Shutdown

<# Apagar o reiniciar un equipo
tsshutdn.exe 
shutdown.exe
Stop-Computer
Restart-Computer
Restart-Computer -Force
#>

cmd /c wmic bios get serialnumber

<#
https://docs.microsoft.com/es-es/powershell/scripting/samples/collecting-information-about-computers?view=powershell-7.1
Recopilar información acerca de los equipos
#>

# Enumerar las revisiones instaladas
Get-CimInstance -ClassName Win32_QuickFixEngineering

## Buscar archivod
Get-ChildItem F:\ -Recurse -Filter *.rdl
Get-ChildItem Z:\Trabajo\MINTIC\ -Recurse -Filter *.rdl
Get-ChildItem E:\CM\Inventario -Recurse -Filter *.xls | select CreationTime, FullName | Where-Object { $_.FullName -like "*nombrearchivo*"}
Get-ChildItem E:\CM\Inventario -Recurse -Filter *.xls | select CreationTime, FullName | Where-Object { $_.CreationTime -like "*2019*"}
Get-ChildItem F:\SoftwareLibrary -Recurse -Filter *.exe | select CreationTime, FullName | Where-Object { $_.CreationTime -like "*02*" -and $_.CreationTime -like "*2019*"}

## Parametros
# https://docs.microsoft.com/es-es/powershell/scripting/dsc/configurations/add-parameters-to-a-configuration?view=powershell-7.1
