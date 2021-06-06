function Refresh-Timer {
param($interval = 5)
    do {
        ping 127.0.0.01
        Start-Sleep -Seconds $interval
        } until ( [System.Console]::KeyAvailable )
}
Refresh-Timer


<#
Outlook permitir enviar correos
#>

Start-Sleep -Seconds 10

function Refresh-Timer {
param($interval = 10)
    do {
        Start-Sleep -Seconds 5
        [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
        Start-Sleep -Seconds 5
        [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
        Start-Sleep -Seconds 5
        [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
        Start-Sleep -Seconds $interval
        } until ( [System.Console]::KeyAvailable )
}
Refresh-Timer