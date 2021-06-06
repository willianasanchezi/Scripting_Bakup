#Biswajit Biswas
#MCC, MCSA, MCTS, CCNA, SME
Function Get-ComInfo {  
param( 
## Computers 
$computers
)
$ErrorActionPreference = "SilentlyContinue"
$uptime = Get-CimInstance Win32_OperatingSystem | select LastBootUpTime 
$time = Get-WmiObject -Class Win32_OperatingSystem
$UP = $time.ConvertToDateTime($time.LocalDateTime) – $time.ConvertToDateTime($time.LastBootUpTime)
$status = Test-Connection -ComputerName $computers -count 1
if ($status.statuscode -eq 0) {
Write-Host "Reachable" $computers "and Bounced" $uptime.LastBootUpTime  "Uptime" $UP -foregroundcolor white -backgroundcolor DarkGreen
} else {
Write-Host "Not Reachable; Why AM I DEAD" $computers -foregroundcolor yellow -BackgroundColor Red
}
}
Get-Content c:\computers.txt | ForEach-Object { Get-ComInfo -computers $_}
Write-Host "I am complete........................................................Happy NEW Year 2014 :)" -foregroundcolor black -backgroundcolor cyan
Get-Date