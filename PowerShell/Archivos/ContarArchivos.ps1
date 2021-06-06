# Cantidad de archivos
(Get-ChildItem C:\carpeta).Count
(Get-ChildItem F:\SoftwareLibrary).Count
(Get-ChildItem -Recurse F:\SoftwareLibrary).Count

# Listado de archivos carpetas y subcarpetas
Get-ChildItem -Recurse F:\SoftwareLibrary
Get-ChildItem -Recurse F:\SoftwareLibrary | Out-File F:\Logs\Archivos.log