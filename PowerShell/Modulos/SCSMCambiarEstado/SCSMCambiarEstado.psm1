function SCSMCambiarEstado(){
Import-Module SMLets
$reader = [System.IO.File]::OpenText("C:\Windows\Config\list.txt")
#$reader = [System.IO.File]::OpenText("E:\Sync\Scripting\SCSM\SCSM_Administracion\Eneldo\list.txt")
# $estado = "Cancelled" # Completed, In Progress,
$estado = Read-Host "Digite el estado (Cancelled, Pending - In Progress,Submitted,Complete - Resolved,Active) "

try 
{
    for() 
    {
        $line = $reader.ReadLine()
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
           "GI*" {$Class = Get-SCSMClass System.WorkItem.Incident$
                    Get-SCSMObject -Class $Class -filter "Id -eq $line" | Set-SCSMObject -Property Status -Value $estado}
          
       }
        # Finaliza Proceso
        $line
     }
}
finally 
{
    $reader.Close()
}

}