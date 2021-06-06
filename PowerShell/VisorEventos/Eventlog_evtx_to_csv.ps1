#Get-WinEvent -Path E:\Sync\Scripting\PowerShell\VisorEventos\Setup.evtx | Export-Csv -LiteralPath E:\Sync\Scripting\PowerShell\VisorEventos\Setup.csv -UseCulture
Get-WinEvent -Path E:\temp\Balsamo\Logs_BALSAMO_evtx\Application.evtx | Export-Csv -Path E:\temp\Balsamo\Logs_BALSAMO_csv\Application.csv -NoTypeInformation
Get-WinEvent -Path E:\temp\Balsamo\Logs_BALSAMO_evtx\System.evtx | Export-Csv -LiteralPath E:\temp\Balsamo\Logs_BALSAMO_csv\System.csv -NoTypeInformation

