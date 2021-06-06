# https://social.technet.microsoft.com/Forums/windowsserver/en-US/0c268c7e-674c-49bc-9933-a87a95f8f44c/powershell-webclientuploadfile?forum=winserverpowershell
# https://www.softzone.es/2016/07/03/descargar-archivo-internet-desde-powershell-windows-10/
# https://blog.jourdant.me/post/3-ways-to-download-files-with-powershell

#$client = new-object System.Net.WebClient
#$client.Credentials = Get-Credential
#$client.DownloadFile(“http://www.softzone.es/app/uploads/2016/06/Brexit-Portada.jpg”,“C:\Imagenes\PortadaSOFTZone.jpg”)

#$descarga = new-object System.Net.WebClient
#$descarga.DownloadFile(“http://www.7-zip.org/a/7z1604.exe”,“D:\7z1604.exe”)

$url = "http://www.7-zip.org/a/7z1604.exe"
#Hace la descarga en la misma ruta donde esta el script
$output = "$PSScriptRoot\7z1604.exe"
#$output = "D:\7z1604.exe"
$start_time = Get-Date
#$wc = New-Object System.Net.WebClient
#$wc.DownloadFile($url, $output)
#OR
(New-Object System.Net.WebClient).DownloadFile($url, $output)
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"