function test01(){
	while($True){
		Get-Date | Out-File E:\Copy1\hora.log
		Start-Sleep -Seconds 15
	}
}

function testGrupo(){
param(
    [Parameter(Mandatory)]
    [string]$grupo
    )
	hostname
	#cmd /c net localgroup administradores
	cmd /c net localgroup $grupo
    cmd /c net user wsanchez /domain
}


function testPuerto80(){
param(
    [Parameter(Mandatory)]
    [string]$servidorurl,
    [Parameter(Mandatory)]
    [string]$puerto
    )
	Test-NetConnection $servidorurl -port $puerto
}

function urldisponible()
{
param(
    [Parameter(Mandatory)]
    [string]$estadourl
    )
	Clear-Host
    Invoke-WebRequest $estadourl -UseBasicParsing 
}

function buscarExtension()
{
param(
    [Parameter(Mandatory)]
    [string]$extension,
        [Parameter(Mandatory)]
    [string]$unidad
    )
	Clear-Host
    $puntos = ":"
    $unidad
    $unidadPuntos = $unidad + $puntos
    Get-ChildItem $unidadPuntos -Recurse -Filter *.$extension
}


# New-Alias isaw Get-ChildItem
# Export-ModuleMember -Function suma -Alias isaw -Variable saludo
Export-ModuleMember -Variable $grupo $servidorurl $puerto $estadourl $unidad $extension