<#
$url = "http://templaurel/Reports_SMDATAWAREHOUSE/Pages/Report.aspx?ItemPath=%2fSystemCenter%2fServiceManager%2fConsultas%2fSCSMEstadoPlataforma"
Invoke-WebRequest $url -Method Get -Credential dominio\usuario
#>


$urls = ("http://enula/webkactus/",
"https://portal3.siifnacion.gov.co/dana-na/auth/url_45/welcome.cgi",
"https://serviciosti.mintic.gov.co/View/cca5abda-6803-4833-accd-d59a43e2d2cf",
"http://subsidios.mintic.gov.co/admin/login"
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