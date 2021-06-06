<#
Determining a User's Last Logon Time
https://technet.microsoft.com/en-us/library/dd378867(v=ws.10).aspx
#>
Import-Module ActiveDirectory

function Get-ADUserLastLogon([string]$userName)
{
  $dcs = Get-ADDomainController -Filter {Name -like "*"}
  $time = 0
  foreach($dc in $dcs)
  { 
    $hostname = $dc.HostName
    $user = Get-ADUser $userName | Get-ADObject -Properties lastLogon 
    if($user.LastLogon -gt $time) 
    {
      $time = $user.LastLogon
    }
  }
  $dt = [DateTime]::FromFileTime($time)
  Write-Host $username "last logged on at:" $dt }

Get-ADUserLastLogon -UserName SaraDavis