Clear-Host
<#
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-5.1
#>
$credenciales = get-credential
$De = "wsanchez@mintic.gov.co"
#$Para = "williansanchez@outlook.com"
$Para = "wsanchez@mintic.gov.co"
$Asunto = "Test Email"
$Mensaje = "Linea 1 <br>"
$Mensaje += "Linea 2 <br>"
$Mensaje += "Linea 3 <br>"
$SMTP = "smtp.office365.com"
$Puerto = "587"
# Send-MailMessage –From $De –To $Para –Subject $Asunto –Body $Mensaje -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto
Send-MailMessage –From $De –To $Para –Subject $Asunto -Body $Mensaje -BodyAsHtml -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto

