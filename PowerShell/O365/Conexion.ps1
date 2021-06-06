$Credenciales = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $Credenciales -Authentication Basic -AllowRedirection
Import-PSSession $Session


