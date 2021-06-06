function testpuertos{
param(
	$intervalo = 60
    )

	Do
	{
		#Clear-Host
		$resultado = Test-NetConnection curcuma.aitsoporte.local -port 80
		$resultado
		
		<# Esta parte aun no funciona
		if ($resultado)
			{
			Write-Host "Puerto abierto"
			}else{
			Write-Host "Puerto cerrado"
			Add-Type -AssemblyName System.Windows.Forms
			[System.Windows.Forms.MessageBox]::Show("Se perdio comunicacion con CURCUMA")
			}
			#>
		Start-Sleep -Seconds $intervalo
	} until ( [System.Console]::KeyAvailable )
        [System.Console]::ReadKey($true) | Out-Null
}
testpuertos