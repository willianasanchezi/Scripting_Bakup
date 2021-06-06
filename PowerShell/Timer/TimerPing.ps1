function timerping {
param($interval = 30)
    do {
		clear-host
		get-date
        ping curcuma.aitsoporte.local
        Start-Sleep -Seconds $interval
        } until ( [System.Console]::KeyAvailable )
}
timerping