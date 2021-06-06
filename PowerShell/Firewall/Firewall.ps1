# Estado del Firewall
netsh advfirewall show allprofiles state
netsh advfirewall show allprofiles

Get-NetFirewallProfile

# Ruta log Firewall
netsh advfirewall show allprofiles | Select-String Filename

# Habilitar log del Firewall

Set-NetFirewallProfile -name domain -LogMaxSizeKilobytes 10240 -LogAllowed true -LogBlocked true
Set-NetFirewallProfile -name public -LogMaxSizeKilobytes 10240 -LogAllowed true -LogBlocked true
Set-NetFirewallProfile -name private -LogMaxSizeKilobytes 10240 -LogAllowed true -LogBlocked true

# Consultar log
Select-String -Path "c:\Windows\system32\LogFiles\Firewall\pfirewall.log" -Pattern "drop" | more
Select-String -Path .\pfirewall.log -Pattern "192.168.91.52"

# Crear reglas y eliminarlas 
New-NetFirewallRule -DisplayName "Block Outbound Port 80" -Direction Outbound -LocalPort 80 -Protocol TCP -Action Block
New-NetFirewallRule -DisplayName "Allow Messenger" -Direction Inbound -Program "C:\Program Files (x86)\Messenger\msmsgs.exe" -RemoteAddress LocalSubnet -Action Allow
Remove-NetFirewallRule

# Consultar reglas
get-NetFirewallRule | Where-Object {$_.Description -like "*135*"}
get-NetFirewallRule | Where-Object {$_.Description -like "*1433*"}
get-NetFirewallRule | Where-Object {$_.DisplayName -like "*SQL*"}

# Puertos abiertos
Get-NetTCPConnection | Select-Object LocalPort
Get-NetUDPEndpoint | Select-Object LocalPort

Get-NetTCPConnection | Where-Object { $_.LocalPort -like "*1433*"}

