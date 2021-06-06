<# Inicio for anidado 2 #>

Clear-Host
$servidores = @("CURCUMA.mintic.gov.co","violeta.mincomunicaciones.gov.co")
$puertos = @(135, 139, 445)
For ($i=0; $i -lt $servidores.Length; $i++){
    For ($j=0; $j -lt $puertos.Length; $j++){
    $resultado = Test-NetConnection $servidores[$i] -port $puertos[$j]
    $resultado 
	#$resultado | Export-Csv -Path $rutaLog -Append
    }
}

<# Fin for anidado 2 #>

<# 1 #>
Clear-Host
$rutaLog = "C:\OM\Test\LogTest.log"
$servidores = @("CURCUMA.mintic.gov.co","violeta.mincomunicaciones.gov.co")
$puertos = @(135, 139, 445)
For ($i=0; $i -lt $servidores.Length; $i++){
    For ($j=0; $j -lt $puertos.Length; $j++){
    $resultado = Test-NetConnection $servidores[$i] -port $puertos[$j]
    $resultado | Out-File -FilePath $rutaLog -Append
    }
}
<# 1 #>