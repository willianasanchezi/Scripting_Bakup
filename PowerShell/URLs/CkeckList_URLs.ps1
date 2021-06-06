<#
$url = "http://templaurel/Reports_SMDATAWAREHOUSE/Pages/Report.aspx?ItemPath=%2fSystemCenter%2fServiceManager%2fConsultas%2fSCSMEstadoPlataforma"
Invoke-WebRequest $url -Method Get -Credential dominio\usuario
#>


$urls = ("http://www.siust.gov.co/hecaa/content/seguridad/login.jsf",
"http://www.siust.gov.co/adminusuarios/content/general/index.jsf"
) # Array

function urldisponible($estadourl)
{
      Invoke-WebRequest $estadourl -UseBasicParsing 
}

clear-host
foreach ($estado in $urls) # Leer Array $lista
{ 
    
    
    $estadourl = $estado # Guardar el valor de lo consultado en el array en la variable $serviciosc
    $estadourl
    urldisponible $estadourl # Enviar valor de la variable a la funcion
}