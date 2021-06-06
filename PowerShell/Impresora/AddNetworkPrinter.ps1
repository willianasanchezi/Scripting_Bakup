$Log = "C:\Windows\Temp\$(gc env:computername).log"
$impresora = (New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\172.23.24.180\Prueba PaperCut")