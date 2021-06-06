# https://blogs.technet.microsoft.com/heyscriptingguy/2012/07/02/use-powershell-for-network-host-and-port-discovery-sweeps/


# Forma 1
Test-NetConnection curcuma -port 80

## Forma 2

try
    {
    (New-Object System.Net.Sockets.TcpClient).Connect('CURCUMA',10123);
    Set-Content -Value 'TRUE' -Path $env:SystemRoot\temp\TCP10123.txt -Force
    }
catch
    {
    Set-Content -Value 'FALSE' -Path $env:SystemRoot\temp\TCP10123.txt -Force
    }

#Forma 3

$ping = New-Object System.Net.Networkinformation.ping
$ping.Send('CURCUMA',800)
## RoundtripTime : 1 # Esta resultado es verdadero
## RoundtripTime : 0 # Esta resultado es falso

#Forma 4
$tcpClient = New-Object System.Net.Sockets.TCPClient
$tcpClient.Connect("CURCUMA",4451)
$tcpClient.Connected


## TCP
Clear-Host
$servidor = "CURCUMA"
$puerto = "60637"
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
##

## UDP

Clear-Host
$servidor = "camamila"
$puerto = "5985"
$tcpClient = New-Object System.Net.Sockets.UdpClient
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

##


