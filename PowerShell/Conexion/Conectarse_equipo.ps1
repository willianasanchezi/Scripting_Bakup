
<#
https://www.youtube.com/watch?v=Jkivk1sG2dk
Ejecutar este comando en el equipo al que se van a conectar
Enable-PSRemoting -Force
winrm quickconfig
Get-Item WSMan:\localhost\Client\TrustedHosts
Set-Item WSMan:\localhost\Client\TrustedHosts "Destkop, Test"
Get-Item WSMan:\localhost\Client\TrustedHosts
#>

Enter-PSSession 'camamila.mincomunicaciones.gov.co' -Credential:'mincom\sccmadm'
Enter-PSSession 'camamila.mincomunicaciones.gov.co' -Port 5986 -Credential:'mincom\sccmadm'
Enter-PSSession 'curcuma.mintic.gov.co' -Credential:'mintic\usr.sccmadm'