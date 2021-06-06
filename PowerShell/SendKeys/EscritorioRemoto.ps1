Add-Type -AssemblyName System.Windows.Forms
function FortiClient(){
    param($clave)
    cd "C:\Program Files\Fortinet\FortiClient\"
    start FortiClient.exe
    Start-Sleep -Seconds 60
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 3}")
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait($clave)
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 2
        [System.Windows.Forms.SendKeys]::SendWait($clave)
    Start-Sleep -Seconds 2
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Write-Host "Conectandose a la VPN"
}
# FortiClient M1nt1c2019*
# FortiClient BI2019!!
FortiClient Lunes2021.

function escritorioremoto()
{
    param($clave)
    #Add-Type -AssemblyName System.Windows.Forms
    start mstsc.exe
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("sauco.aitsoporte.local")
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 10
    [System.Windows.Forms.SendKeys]::SendWait($clave)
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("%{TAB}") # ALT + TAB
    Start-Sleep -Seconds 20
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 3}") # Tres TAB
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
}


Start-Sleep -Seconds 60
if (Test-Connection sauco.aitsoporte.local -Count 1 -ErrorAction SilentlyContinue) 
    { write-host "Responde a Ping, conectanse a Escritorio Remoto" 
     escritorioremoto -Clave 4dm1nc0nf1gur4t10n$
    } 
else 
    {
    Get-Process | Where-Object {$_.ProcessName -like "*Forti*"}
    Start-Sleep -Seconds 5
    Stop-Process -Name "FortiTray" -Force
    Stop-Process -Name "FortiClient" -Force
    Stop-Process -Name "FortiSSLVPNdaemon" -Force
    Stop-Process -Name "FortiTray" -Force
    write-host "No Reponde a Ping, proceso finalizado"
    }

<#
Test-Connection sauco.aitsoporte.local
Test-Connection 127.0.0.1 -Count 1 | select * 
Test-Connection alcandorea.aitsoporte.local
#>




<#
function escritorioremoto()
{
    param($clave)
    #Add-Type -AssemblyName System.Windows.Forms
    start mstsc.exe
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("192.168.1.121")
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 10
    [System.Windows.Forms.SendKeys]::SendWait($clave)
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("%{TAB}") # ALT + TAB
    Start-Sleep -Seconds 20
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 3}") # Tres TAB
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
}
escritorioremoto -Clave 12345.abcde
#>

