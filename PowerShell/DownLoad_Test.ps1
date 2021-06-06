$url = "https://190.60.104.98/lang/en.js"
$output = "$PSScriptRoot\en.js"
$start_time = Get-Date
(New-Object System.Net.WebClient).DownloadFile($url, $output)
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"