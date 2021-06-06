function SizeDiscosServidores(){
param(
    [Parameter(Mandatory)]
    [string]$servidor
    )	
	Invoke-Command -ComputerName $servidor {get-volume | Out-Default}
}

function SMImportModulo (){
	Invoke-Command -ComputerName doradilla.mintic.gov.co {
	$Projection = Get-SCSMTypeProjection Microsoft.SystemCenter.Orchestrator.RunbookAutomationActivity.Projection
	}
}