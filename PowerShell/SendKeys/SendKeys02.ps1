<#
https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.sendkeys?view=netframework-4.8
https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/sendkeys-statement
https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.sendkeys.send?redirectedfrom=MSDN&view=netframework-4.8#System_Windows_Forms_SendKeys_Send_System_String_
https://rosettacode.org/wiki/Simulate_input/Keyboard#PowerShell
https://tecnologia-informatica.com/comandos-teclado-atajos/
https://support.softomotive.com/support/solutions/articles/35000098627-how-to-send-keys-and-key-combinations
https://www.autoitscript.com/autoit3/docs/appendix/SendKeys.htm
#>

function atajosteclado()
{
    [System.Windows.Forms.SendKeys]::SendWait("^(g)") # Guardar Ctrl + G
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("%")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN 3}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

    <# Inicio #>
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("^{ESC}") # Inicio 

    Start-Sleep -Seconds 1
    For ($i=0; $i -le 2; $i++) {
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    }

    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

}
atajosteclado

function calculadora()
{
    param($num1, $num2)
    #Add-Type -AssemblyName Microsoft.VisualBasic
    #Add-Type -AssemblyName System.Windows.Forms
    start calc.exe
    #[Microsoft.VisualBasic.Interaction]::AppActivate("Calc")
    Start-Sleep -Seconds 10
    #[System.Windows.Forms.SendKeys]::SendWait("2{ADD}2=")
    [System.Windows.Forms.SendKeys]::SendWait("" + $num1 + "{ADD}" + $num2 + "=")
}
calculadora 10 3

function notepad()
{
    #Add-Type -AssemblyName Microsoft.VisualBasic
    #Add-Type -AssemblyName System.Windows.Forms
    start notepad.exe
    #[Microsoft.VisualBasic.Interaction]::AppActivate("notepad")
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("Test")
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("%")
    #[System.Windows.Forms.SendKeys]::SendWait("{DOWN}") # Flecha abajo
    For ($i=0; $i -le 6; $i++) {
      [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")  
    }
    Start-Sleep -Seconds 10
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")  
}
notepad

function escritorioremoto()
{
    param($clave)
    #Add-Type -AssemblyName System.Windows.Forms
    start mstsc.exe
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 10
    [System.Windows.Forms.SendKeys]::SendWait($clave)
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
}
escritorioremoto -Clave 4dm1nc0nf1gur4t10n$


function anydesk()
{
    C:\Users\SCTEST01\Downloads\AnyDesk.exe
}
anydesk

function abrirExcel()
{
    <#
    https://lazywinadmin.com/2014/03/powershell-read-excel-file-using-com.html
    https://mcpmag.com/articles/2018/04/06/find-excel-data-with-powershell.aspx
    https://docs.microsoft.com/en-us/office/vba/api/excel.workbooks.open
    #> 
    $excel = New-Object -ComObject Excel.Application # Ejecutar esta linea para que se puedan ver las propiedades de $excel
    $excel.Visible = $true
    $libro = $excel.Workbooks.Open("E:\Sync\Trabajo\MINTIC\Servidores_SC\Servidores_SC.xlsx")
    $hoja = $libro.Worksheets.Select(2)
    $hoja.Name
    #$buscar = $hoja.Cells.Find('VIOLETA')
}
abrirExcel

function sccm()
{
    start "E:\Program Files\Microsoft Configuration Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe"
    Start-Sleep -Seconds 10
    For ($i=0; $i -le 1; $i++) {
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    }
    Start-Sleep -Seconds 5
    For ($i=0; $i -le 3; $i++) {
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    }
    [System.Windows.Forms.SendKeys]::SendWait("{ADD}")
    Start-Sleep -Seconds 5
    For ($i=0; $i -le 8; $i++) {
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    }
    
    Start-Sleep -Seconds 5
    For ($i=0; $i -le 1; $i++) {
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    }

    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("PADCONC5370")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 2
    For ($i=0; $i -le 1; $i++) {
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    }
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{CAPSLOCK}+{F10}") # Clic derecho
}
sccm


function scom()
{
<#
Start-Sleep -Seconds 10
[System.Windows.Forms.SendKeys]::SendWait("SERVICE MANAGER")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
#>

Start-Sleep -Seconds 10
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("%")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
}
scom




<#
posicion mouse
#>
while(1)
{
[System.Windows.Forms.UserControl]::MouseButtons
[System.Windows.Forms.Cursor]::Position 
}