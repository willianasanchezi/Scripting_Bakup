    Import-Module OperationsManager
    $ms = Read-host “Introduce el Management server de SCOM”
    New-SCOMManagementGroupConnection $ms

    New-Item .\mps -ItemType Directory -ErrorAction SilentlyContinue
    $mp = Read-host “Introduce nombre del MP o * para sacar todos”

    $mpbueno = Get-SCOMManagementPack -DisplayName “*$mp*”

    Foreach ($mps in $mpbueno){

    $carpeta = $mps.displayname

    New-Item .\mps\$carpeta -ItemType Directory -ErrorAction SilentlyContinue

    Get-SCOMMonitor -ManagementPack $mps | Export-Csv -Delimiter “;” .\mps\$carpeta\Monitores.csv
    Get-SCOMRule -ManagementPack $mps | Export-Csv -Delimiter “;” .\mps\$carpeta\Reglas.csv
    }