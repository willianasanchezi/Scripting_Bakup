<# 
Ejecutar como administrador 
Crear carpeta C:\Windows\ConfigSC\
#>


$lista1 = ("HealthService","OMSDK","OMCFG") # Array
$lista2 = ("OMCFG","OMSDK","HealthService") # Array

function sevicioexiste($serviciosc)
{
    
    $consulta1 = Get-Service | Where-Object {$_.Name -eq $serviciosc}
    # Signo de ! es -not o not equal
    if (!$consulta1)
    {
        $aviso1 = "No Existe el servicio $serviciosc"
    }
    else
    {
            # Inicio: detener servicio
            
            $consulta2 = Get-Service | Where-Object {$_.Name -eq $serviciosc -band $_.Status -eq "Running"}
            
            # Signo de ! es -not o not equal
            if (!$consulta2)
            {
                $aviso2 = "Running1 $serviciosc"
            }
            else
            {
                $aviso2 = "Running2 $serviciosc"
                Stop-Service -Name $serviciosc
                
            }
            $aviso2
            # Fin: detener servicio
    }
    $aviso1
}



function seviciodetenido($serviciosc)
{
    
    $consulta1 = Get-Service | Where-Object {$_.Name -eq $serviciosc}
    if (!$consulta1)
    {
        $aviso1 = "No Existe el servicio $serviciosc"
    }
    else
    {
            # Inicio
            
            $consulta2 = Get-Service | Where-Object {$_.Name -eq $serviciosc -band $_.Status -eq "Stopped"}
            
            # Signo de ! es -not o not equal
            if (!$consulta2)
            {
                $aviso2 = "Stopped1 $serviciosc"                
            }
            else
            {
                $aviso2 = "Stopped2 $serviciosc"
                borrarcarpeta # Ejecutar la funcion
            }
            $aviso2
            # Fin
    }
    $aviso1
}

function seviciosubir($serviciosc)
{
    
    $consulta1 = Get-Service | Where-Object {$_.Name -eq $serviciosc}
    if (!$consulta1)
    {
        $aviso1 = "No Existe el servicio $serviciosc"
    }
    else
    {
            # Inicio
            
            $consulta2 = Get-Service | Where-Object {$_.Name -eq $serviciosc -band $_.Status -eq "Stopped"}
            
            if (!$consulta2)
            {
                $aviso2 = "Start1 $serviciosc"
            }
            else
            {
                $aviso2 = "Start2 $serviciosc"
                Start-Service -Name $serviciosc 
            }
            $aviso2
            # Fin
    }
    $aviso1
}

function borrarcarpeta ()
{
    
    do
        {       
        $consulta3 = Get-Service | Where-Object {$_.Name -eq "Audiosrv" -band $_.Status -eq "Stopped"}  # Consulta de estado del servicio
		Start-Sleep -s 10
        }       
    while (!$consulta3) # Mientras el servicio no se encuentre detenido se va a seguir ejecutando la consulta
    
    
    
    $ruta1 = "E:\Program Files\Microsoft System Center\Service Manager\Health Service State" # Colocamos la ruta en una variable
    $existeruta = Test-Path $ruta1 # Con el comando Test-Path validamos la ruta, si existe de True sino da False
    
    if ($existeruta -eq $True) # Validamos si el resultado del test es True o False
        {       
        $aviso = "Archivo Existe" # Si es True se guarda el siguiente texto en la variable $aviso
        Remove-Item "E:\Program Files\Microsoft System Center\Service Manager\Health Service State" -Recurse # Inicio Borrar Carpetas      
        }
    else
        {        
        $aviso = "Archivo No Existe" # Si es False se guarda el siguiente texto en la variable $aviso
        }
    $aviso            
}


foreach ($servicio in $lista1) # Leer Array $lista
{ 
    
    $serviciosc = $servicio # Guardar el valor de lo consultado en el array en la variable $serviciosc
    sevicioexiste $serviciosc # Enviar valor de la variable a la funcion
}


foreach ($servicio in $lista1) # Leer Array $lista
{ 
    
    $serviciosc = $servicio # Guardar el valor de lo consultado en el array en la variable $serviciosc
    seviciodetenido $serviciosc # Enviar valor de la variable a la funcion
}

foreach ($servicio in $lista2) # Leer Array $lista
{ 
    
    $serviciosc = $servicio # Guardar el valor de lo consultado en el array en la variable $serviciosc
    seviciosubir $serviciosc # Enviar valor de la variable a la funcion
    Get-Service $serviciosc
}

Clear-Host
Get-Date
foreach ($servicio in $lista1) # Leer Array $lista
{ 
    
    $serviciosc = $servicio # Guardar el valor de lo consultado en el array en la variable $serviciosc
    Get-Service $serviciosc
}