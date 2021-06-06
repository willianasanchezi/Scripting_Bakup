<#
https://docs.microsoft.com/es-es/azure/active-directory/hybrid/how-to-connect-sync-staging-server
#>

%ProgramFiles%\Microsoft Azure AD Sync\bin
csexport "Name of Connector" %temp%\export.xml /f:x
CSExportAnalyzer %temp%\export.xml > %temp%\export.csv
.\csanalyzer.ps1 -xmltoimport %temp%\export.xml