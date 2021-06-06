#
# Windows PowerShell script for AD DS Deployment
#

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "D:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "aitsoporte.local" `
-DomainNetbiosName "AITSOPORTE" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "D:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "D:\Windows\SYSVOL" `
-Force:$true
