function SCSMCiresonCacheReiniciar(){
restart-service -Name CacheBuilder
iisreset
Start-Sleep -Seconds 5
get-service -Name CacheBuilder
iisreset /status
}