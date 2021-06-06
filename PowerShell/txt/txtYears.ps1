$reader = [System.IO.File]::OpenText("E:\Sync\Scripting\PowerShell\txt\Usuarios.csv")
$rutaLog = "E:\Sync\Scripting\PowerShell\txt\LogArhivo.log"
try 
{
    for() 
    {
        $line = $reader.ReadLine()
        if ($line -eq $null) { break }
        #$line

        $line1 = $line -split (",")
        $sr = $line1[0]
        $numero = $line1[1]
        
        <#
        Write-Host $numero 
        $formato = '"' + $numero + '",' 
        $formato | Out-File -FilePath $rutaLog -Append
        #>
        Write-Host $sr $numero
        $formato = '"' + $sr + '",' 
        $formato | Out-File -FilePath $rutaLog -Append
 }       
}
finally 
{
    $reader.Close()
}