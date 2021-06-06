#Cambiar la politica de ejecucion
Set-ExecutionPolicy -ExecutionPolicy Bypass
#Declarar las credenciales del admin
$powerUser = "correo@coem.co"
$powerPass = "Password"
$password = ConvertTo-SecureString $powerPass -AsPlainText -Force
$adminCredential = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $powerUser,$password
$O365Cred = $adminCredential
#Conecta con el servicio de Office 365
Connect-MSOLservice –Credential $O365Cred
#Importar el módulo
Import-Module MSOnline
#Importa la sesión de Powershell localmente
$exchangeSession = New-PSSession –ConfigurationName Microsoft.Exchange –ConnectionUri https://ps.outlook.com/powershell -Credential $O365Cred -Authentication "Basic" -AllowRedirection
Import-PSSession $exchangeSession
#Borrar contenido del correo y Enviar reporte diario
Search-Mailbox -Identity "prueba.correo@coem.co" -SearchQuery kind:email -TargetMailbox "lballesteros@atlas.com.co" -TargetFolder "SearchAndDelete" -DeleteContent -Force
#Cerrar Sesion en O365
Remove-PSSession $Session