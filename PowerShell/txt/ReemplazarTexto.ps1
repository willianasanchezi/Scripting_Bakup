$leer = [System.IO.File]::OpenText("E:\Scripting\PowerShell\txt\listado.txt")
$rutaArchivo = "E:\Scripting\PowerShell\txt\Templates01.xml"
$rutaLog = "E:\Scripting\PowerShell\txt\LogListado.log"
try 
{
    for() 
    {
        $linea = $leer.ReadLine()
        if ($linea -eq $null) { break }

        $linea1 = $linea -split (",")
        $antiguo = $linea1[0]
        $nuevo = $linea1[1]
        
        (Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo
        #(Get-Content -path $rutaArchivo).Replace($antiguo,$nuevo) | Set-Content $rutaArchivo
        Write-Host $antiguo $nuevo       
    }
}
finally 
{
    $leer.Close()
}