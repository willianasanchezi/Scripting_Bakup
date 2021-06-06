# Script probado
# https://community.spiceworks.com/how_to/90853-how-to-test-office-365-smtp-server-using-powershell
clear
$msolcred = get-credential
# Send-MailMessage –From wsanchez@mintic.gov.co –To wsanchez@mintic.gov.co –Subject “Test Email” –Body “Prueba SMTP Relay Service, enviado ISAW” -SmtpServer smtp.office365.com -Credential $msolcred -UseSsl -Port 587
Send-MailMessage –From wsanchez@mintic.gov.co –To externo@mintic.gov.co –Subject “Test Email” –Body “Prueba SMTP Relay Service, enviado ISAW” -SmtpServer smtp.office365.com -Credential $msolcred -UseSsl -Port 587
<#
$EmailFrom = "wsanchez@mintic.gov.co"
$EmailTo = "externo@mintic.gov.co" 
$Subject = "Pruebas Grupo" 
$Body = "Prueba envio correo" 
$SMTPServer = "smtp.servidor.com" 
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25) 
$SMTPClient.EnableSsl = $false
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("desde@servidor.com", "contraseÃ±a"); 

$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
#>