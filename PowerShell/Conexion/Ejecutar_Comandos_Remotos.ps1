Enter-PSSession eneldo.mincomunicaciones.gov.co -Credential mincom\scsmadm
Invoke-Command -ComputerName eneldo.mincomunicaciones.gov.co {get-service -name winrm}
Invoke-Command -ComputerName eneldo.mincomunicaciones.gov.co -FilePath E:\Sync\Scripting\PowerShell\Conexion\test.ps1