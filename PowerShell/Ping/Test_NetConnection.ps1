Clear-Host
$servidores = @("ucsserver2.aitsoporte.local",
"TIBUCHINA.aitsoporte.local",
"TANACETO.aitsoporte.local",
"tamarindo.aitsoporte.local",
"SRV-SSRS1.aitsoporte.local",
"SRV-SSIS1.aitsoporte.local",
"SRV-SSAS1.aitsoporte.local",
"PALIURE.aitsoporte.local",
"DUBOISIA.aitsoporte.local",
"DRABA.aitsoporte.local",
"doradilla.aitsoporte.local",
"CILANTRO.aitsoporte.local",
"aloe.aitsoporte.local")
For ($i=0; $i -lt $servidores.Length; $i++) {
    $resultado = Test-NetConnection -ComputerName $servidores[$i] -port 135
    $servidores[$i], $resultado
    }