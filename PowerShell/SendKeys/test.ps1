Add-Type -AssemblyName System.Windows.Forms
function escritorioremoto(){
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 3}")
    write-host "Hola"
    }

if (Test-Connection 127.0.0.1 -Count 1 -ErrorAction SilentlyContinue) 
    { write-host "Responde a Ping" 
    escritorioremoto
    } 
else 
    {
    write-host "No Reponde a Ping"
    }