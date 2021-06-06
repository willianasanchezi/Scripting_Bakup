function reportingParametrosPropiedades()
{
<# Inicio Colocar Año #>
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{CAPSLOCK}+{F10}") # Doble Clic
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("AÑO")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 9}")
<# Fin Colocar Año  #>

# Available Value
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN 3}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 4}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DEL}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 3}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
<#Fin Year #>

<# Inicio Trimestre #>
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{CAPSLOCK}+{F10}") # Doble Clic
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")

    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}") # Add
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    For ($i=0; $i -le 1; $i++) {
            Start-Sleep -Seconds 0
            [System.Windows.Forms.SendKeys]::SendWait("+{TAB}")
            }
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    For ($i=0; $i -le 6; $i++) {
            Start-Sleep -Seconds 0
            [System.Windows.Forms.SendKeys]::SendWait("+{TAB}")
            }
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    For ($i=0; $i -le 10; $i++) {
            Start-Sleep -Seconds 0
            [System.Windows.Forms.SendKeys]::SendWait("+{TAB}")
            }
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    For ($i=0; $i -le 14; $i++) {
            Start-Sleep -Seconds 0
            [System.Windows.Forms.SendKeys]::SendWait("+{TAB}")
            }
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    For ($i=0; $i -le 15; $i++) {
            Start-Sleep -Seconds 0
            [System.Windows.Forms.SendKeys]::SendWait("+{TAB}")
            }
<# Inicio Ingresar Valores Trimestre #>
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{1}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{1}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{3}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{3}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{4}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{4}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("No Aplica")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 2}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DEL}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 5}")

<# Fin Ingresar Valores Trimestre #>

<# Inicio Default #>
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{DEL}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB 3}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
<# Fin Default #>


<# Fin Trimestre #>
}
reportingParametrosPropiedades



<#DataSet Año#>
Start-Sleep -Seconds 5
[System.Windows.Forms.SendKeys]::SendWait("{CAPSLOCK}+{F10}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("Y")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{DOWN}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{DOWN 2}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB 3}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("SELECT * FROM YEAR")



function reportingDataSetProperties()
{
    Start-Sleep -Seconds 5
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("F")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{down}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{down}")
    Start-Sleep -Seconds 1
        For ($i=0; $i -le 2; $i++) {
        [System.Windows.Forms.SendKeys]::SendWait("{TAB}")
        }
}
reportingDataSetProperties


