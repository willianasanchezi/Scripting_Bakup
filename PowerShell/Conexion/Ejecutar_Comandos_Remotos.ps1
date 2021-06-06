Enter-PSSession eneldo.aitsoporte.local -Credential mincom\scsmadm
Invoke-Command -ComputerName eneldo.aitsoporte.local {get-service -name winrm}
Invoke-Command -ComputerName eneldo.aitsoporte.local -FilePath E:\Sync\Scripting\PowerShell\Conexion\test.ps1