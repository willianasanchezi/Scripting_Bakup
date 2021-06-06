Clear-Host
$servidores = @("ucsserver2.mintic.gov.co",
"TIBUCHINA.mintic.gov.co",
"TANACETO.mintic.gov.co",
"tamarindo.mintic.gov.co",
"SRV-SSRS1.mintic.gov.co",
"SRV-SSIS1.mintic.gov.co",
"SRV-SSAS1.mintic.gov.co",
"PALIURE.mintic.gov.co",
"DUBOISIA.mintic.gov.co",
"DRABA.mintic.gov.co",
"doradilla.mintic.gov.co",
"CILANTRO.mintic.gov.co",
"aloe.mintic.gov.co")
For ($i=0; $i -lt $servidores.Length; $i++) {
    $resultado = Test-NetConnection -ComputerName $servidores[$i] -port 135
    $servidores[$i], $resultado
    }