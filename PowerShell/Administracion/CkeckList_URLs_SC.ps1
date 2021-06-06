<#
$url = "http://templaurel/Reports_SMDATAWAREHOUSE/Pages/Report.aspx?ItemPath=%2fSystemCenter%2fServiceManager%2fConsultas%2fSCSMEstadoPlataforma"
Invoke-WebRequest $url -Method Get -Credential dominio\usuario
#>


$urls = ("http://guarana/Reports_SCDB/Pages/Folder.aspx?ItemPath=%2fConfigMgr_MIN%2fReportes_MINTIC",
"http://cardamomo/Reports_SCCMREPORTINGDB/Pages/Folder.aspx?ItemPath=%2fConfigMgr_TIC%2fReportes_MINTIC",
"http://citronela.mintic.gov.co/OperationsManager/",
"http://violeta.mincomunicaciones.gov.co/OperationsManager/",
"http://curcuma.mintic.gov.co/CMApplicationCatalog/#/SoftwareLibrary/AppListPageView.xaml",
"http://curcuma.mintic.gov.co/software_center/",
"http://templaurel/Reports_SMDATAWAREHOUSE/Pages/Report.aspx?ItemPath=%2fSystemCenter%2fServiceManager%2fConsultas%2fSCSMEstadoPlataforma") # Array

function urldisponible($estadourl)
{
      Invoke-WebRequest $estadourl -Method Get -Credential dominio\usuario
}

clear-host
foreach ($estado in $urls) # Leer Array $lista
{ 
    
    
    $estadourl = $estado # Guardar el valor de lo consultado en el array en la variable $serviciosc
    $estadourl
    urldisponible $estadourl # Enviar valor de la variable a la funcion
}