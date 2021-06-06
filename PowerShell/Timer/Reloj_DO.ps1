function reloj{
param(
	$intervalo = 1
    )
	Do
	{
	clear-host
	write-host "PowerShell"
	get-date
	Start-Sleep -Seconds $intervalo
	} until ( [System.Console]::KeyAvailable )
        [System.Console]::ReadKey($true) | Out-Null
}
reloj