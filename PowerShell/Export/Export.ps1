Get-Process | Export-Csv -LiteralPath E:\Procesos.csv -Encoding UTF8
Get-ChildItem | select name | Export-Csv -LiteralPath E:\Formatos.csv -Encoding UTF8