<#
Send HTML Email and attachment Powershell
https://gallery.technet.microsoft.com/scriptcenter/Send-HTML-Email-Powershell-6653235c
#>

############################################################################### 
 
###########Define Variables######## 
 
$fromaddress = "donotreply@labtest.com" 
$toaddress = "Aishwarya.Rawat@labtest.com" 
$bccaddress = "Vikas.sukhija@labtest.com" 
$CCaddress = "Mahesh.Sharma@labtest.com" 
$Subject = "ACtion Required" 
$body = get-content .\content.htm 
$attachment = "C:\sendemail\test.txt" 
$smtpserver = "smtp.labtest.com" 
 
#################################### 
 
$message = new-object System.Net.Mail.MailMessage 
$message.From = $fromaddress 
$message.To.Add($toaddress) 
$message.CC.Add($CCaddress) 
$message.Bcc.Add($bccaddress) 
$message.IsBodyHtml = $True 
$message.Subject = $Subject 
$attach = new-object Net.Mail.Attachment($attachment) 
$message.Attachments.Add($attach) 
$message.body = $body 
$smtp = new-object Net.Mail.SmtpClient($smtpserver) 
$smtp.Send($message) 
 
#################################################################################