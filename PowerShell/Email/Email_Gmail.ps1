Clear-Host
<#
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/send-mailmessage?view=powershell-5.1
En la cuenta de Gmail,  en reenvio y correo POP/IMAP habilitar POP para todos los mensajes y
habilitar acceso a apps menos seguras
https://www.youtube.com/watch?v=NDPG0JuWL90
#>
$credenciales = get-credential
$De = "willianasancheziba@gmail.com"
$Para = "willianasancheziba@gmail.com"
$Asunto = "Test Email"
$Mensaje = "Test"
$SMTP = "smtp.gmail.com"
$Puerto = "587"
# Send-MailMessage -From $De -To $Para -Subject $Asunto -Body $Mensaje -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto
Send-MailMessage -From $De -To $Para -Subject $Asunto -Body $Mensaje -SmtpServer $SMTP -Credential $credenciales -UseSsl -Port $Puerto
