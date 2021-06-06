# https://technet.microsoft.com/es-es/library/hh847850.aspx
# https://blogs.msdn.microsoft.com/wmi/2009/07/24/powershell-remoting-between-two-workgroup-machines/
Enable-PSRemoting -Force
Start-Service WinRM
Set-ItemProperty –Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System –Name  LocalAccountTokenFilterPolicy –Value 1 –Type DWord
Set-ItemProperty –Path HKLM:\System\CurrentControlSet\Control\Lsa –Name ForceGuest –Value 0
Set-Item WSMan:\localhost\Client\TrustedHosts –Value <ServerMachineName> -Force
Set-Item WSMan:\localhost\Client\TrustedHosts –Value <ServerMachineName> -Force -Concatenate
Get-Service WinRM
Test-WSMan –Auth default
Get-PSSessionConfiguration
New-PSSession
Get-ItemProperty –Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System –Name LocalAccountTokenFilterPolicy*
Get-ItemProperty –Path HKLM:\System\CurrentControlSet\Control\Lsa –Name ForceGuest*
winrm enumerate winrm/config/listener
<#
Get-Help about_remote_troubleshooting
#>