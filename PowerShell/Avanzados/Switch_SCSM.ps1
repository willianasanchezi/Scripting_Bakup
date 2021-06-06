Import-Module SMLets # Importar Modulo de SCSM
$reader = [System.IO.File]::OpenText("C:\TI\listado.txt") # Lee archivo de texto que contiene los numeros de casos o actividades
$estado = "Cancelled" # estado que se le va asignar a los casos o actividades

try 
{
    for() # Bucle para leer el contenido del archivo de texto
    {
        $line = $reader.ReadLine() # Variable que guarda 
        if ($line -eq $null) { break }
        # Inicia Proceso
            switch -Wildcard ($line)
       {

           "GR*" {$Class = Get-SCSMClass System.WorkItem.ServiceRequest$
                    Get-SCSMObject -Class $Class -filter "Id -eq $line" | Set-SCSMObject -Property Status -Value $estado}
           "AR*" {$ReviewActivity = Get-SCSMObject -Class (Get-SCSMClass -Name System.WorkItem.Activity.ReviewActivity$) -filter "ID -eq $line"
                   Set-SCSMObject -SMObject $ReviewActivity -Property Status -Value $estado}
           "AM*" {$ManualActivity = Get-SCSMObject -Class (Get-SCSMClass -Name System.WorkItem.Activity.ManualActivity$) -filter "ID -eq $line"
                    Set-SCSMObject -SMObject $ManualActivity -Property Status -Value $estado}
           "RB*" {$Class = Get-SCSMClass Microsoft.SystemCenter.Orchestrator.RunbookAutomationActivity$
                    Get-SCSMObject -Class $Class -filter "Id -eq $line" | Set-SCSMObject -Property Status -Value $estado}
           "AP*" {$ParallelActivity = Get-SCSMObject -Class (Get-SCSMClass -Name System.WorkItem.Activity.ParallelActivity$) -filter "ID -eq $line"
                    Set-SCSMObject -SMObject $ParallelActivity -Property Status -Value $estado}
          
       }
        # Finaliza Proceso
        $line
     }
}
finally 
{
    $reader.Close()
}

<#
Estados:
'Completed' (ActivityStatusEnum.Completed)
'Cancelled' (ActivityStatusEnum.Cancelled)
'Skipped' (ActivityStatusEnum.Skipped)
'In Progress' (ActivityStatusEnum.Active)
'On Hold' (ActivityStatusEnum.OnHold)
'Failed' (ActivityStatusEnum.Failed)
'Rerun' (ActivityStatusEnum.Rerun)
'Pending' (ActivityStatusEnum.Ready)
#>
