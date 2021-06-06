## TCP

Clear-Host
$servidor = "192.168.1.3"
$puerto = "5985"
$ping = Test-Connection $servidor
$tcpClient = New-Object System.Net.Sockets.TCPClient
$tcpClient.Connect($servidor,$puerto)
if ($tcpClient.Connected)
{
  Clear-Host
  "Puerto Abierto"    
}
else
{
  Clear-Host
  "Puerto Cerrado"
}

## UDP

Clear-Host
$servidor = "192.168.1.3"
$puerto = "139"
$ping = Test-Connection $servidor
$udpClient = New-Object System.Net.Sockets.UDPClient
$udpClient.Connect($servidor,$puerto)
if ($udpClient.Connected)
{
  Clear-Host
  "Puerto Abierto"    
}
else
{
  Clear-Host
  "Puerto Cerrado"
}


<#
https://learn-powershell.net/2011/02/21/querying-udp-ports-with-powershell/
#>