# Windows PowerShell equivalents for common networking commands (IPCONFIG, PING, NSLOOKUP)
# https://blogs.technet.microsoft.com/josebda/2015/04/18/windows-powershell-equivalents-for-common-networking-commands-ipconfig-ping-nslookup/

Get-Command -Module Net* | Group Module # Ayuda del modulo Net

# IPCONFIG
# Get-NetIPConfiguration or Get-NetIPAddress

Get-NetIPConfiguration
Get-NetIPAddress | Sort InterfaceIndex | FT InterfaceIndex, InterfaceAlias, AddressFamily, IPAddress, PrefixLength -Autosize
Get-NetIPAddress | ? AddressFamily -eq IPv4 | FT –AutoSize
Get-NetAdapter Wi-Fi | Get-NetIPAddress | FT -AutoSize

# PING
# Test-NetConnection
Test-NetConnection 127.0.0.1

# TELNET
Test-NetConnection 127.0.0.1 -Port 80
## Prueba de puertos Opcion 1
try
    {
    (New-Object System.Net.Sockets.TcpClient).Connect('CURCUMA',10123);
    Set-Content -Value 'TRUE' -Path $env:SystemRoot\temp\TCP10123.txt -Force
    }
catch
    {
    Set-Content -Value 'FALSE' -Path $env:SystemRoot\temp\TCP10123.txt -Force
    }

## Prueba de puertos Opcion 2

## con IF

Clear-Host
$servidor = "CURCUMA"
$puerto = "80"
$tcpClient = New-Object System.Net.Sockets.TCPClient
$tcpClient.Connect($servidor,$puerto)
if ($tcpClient.Connected)
{
  "Puerto Abierto"    
}
else
{
   "Puerto Cerrado"
}


##


# NSLOOKUP
Resolve-DnsName www.microsoft.com
Resolve-DnsName microsoft.com -type SOA
Resolve-DnsName microsoft.com -Server 8.8.8.8 –Type A

# ROUTE
Get-NetRoute -Protocol Local -DestinationPrefix 192.168*
Get-NetAdapter Wi-Fi | Get-NetRoute

# TRACERT
Test-NetConnection www.microsoft.com –TraceRoute
Test-NetConnection outlook.com -TraceRoute | Select -ExpandProperty TraceRoute | % { Resolve-DnsName $_ -type PTR -ErrorAction SilentlyContinue }

# NETSTAT
Get-NetTCPConnection | Group State, RemotePort | Sort Count | FT Count, Name –Autosize
Get-NetTCPConnection | ? State -eq Established | FT –Autosize
Get-NetTCPConnection | ? State -eq Established | ? RemoteAddress -notlike 127* | % { $_; Resolve-DnsName $_.RemoteAddress -type PTR -ErrorAction SilentlyContinue }

