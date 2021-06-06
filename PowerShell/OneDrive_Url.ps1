$urls = ("http://admin.onedrive.com",
"http://oneclient.sfx.ms",
"https://officeclient.microsoft.com/config16",
"http://odc.officeapps.live.com/odc/emailhrd",
"login.microsoftonline.com",
"skydrive.wns.windows.com") # Array

function urldisponible($estadourl)
{
      # Invoke-WebRequest $estadourl-UseBasicParsing -Method Head
      Invoke-WebRequest $estadourl -MaximumRedirection 0 -ErrorAction Ignore
}

clear-host
foreach ($estado in $urls) # Leer Array $lista
{ 
    
    
    $estadourl = $estado # Guardar el valor de lo consultado en el array en la variable $serviciosc
    $estadourl
    urldisponible $estadourl # Enviar valor de la variable a la funcion
}