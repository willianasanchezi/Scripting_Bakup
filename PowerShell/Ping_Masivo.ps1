$servers = Get-Content .\serverList.txt
$ping = New-Object System.Net.NetworkInformation.Ping
 
foreach($s in $servers)
{
    $("$s,$($ping.Send($s).Address)")
}