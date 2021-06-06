Clear-Host
<#
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-5.1
#>
$credenciales = get-credential
$De = "monitoreoscom@unisabana.edu.co"
$Para = "focampo@coem.co"
$Asunto = "Test Email"
$Mensaje = "Test"
$SMTP = "smtp.office365.com"
$Puerto = "587"
# Send-MailMessage -From $De -To $Para -Subject $Asunto -Body $Mensaje -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto
Send-MailMessage -From $De -To $Para -Subject $Asunto -Body $Mensaje -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto


#######


Clear-Host
<#
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-5.1
#>
$credenciales = get-credential
$De = "test1sm@mintic.gov.co"
$Para = "wsanchez@coem.co"
$Asunto = "Test Email"
$Mensaje = "Test"
$SMTP = "smtp.office365.com"
$Puerto = "587"
Send-MailMessage -From $De -To $Para -Subject $Asunto -Body $Mensaje -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto

#######


Clear-Host
<#
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-5.1
#>
$credenciales = get-credential
$De = "wsanchez@coem.co"
$Para = "willianasanchezi@gmail.com"
$Asunto = "Test Email"
$Mensaje = "Test"
$SMTP = "smtp.office365.com"
$Puerto = "587"
Send-MailMessage -From $De -To $Para -Subject $Asunto -Body $Mensaje -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto

