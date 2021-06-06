Clear-Content E:\SMScript\Happy\Correo.txt
$reader = [System.IO.File]::OpenText("E:\SMScript\Happy\list.txt")
$rutaLog = "E:\SMScript\Happy\LogHappy.log"
try 
{
    for() 
    {
        $line = $reader.ReadLine()

        if ($line -eq $null) { break }

        $line1 = $line -split (",")
        $nombre = $line1[0]
        $correo = $line1[1]
        $diaHappy = $line1[2]
        $mesHappy = $line1[3]
        $img = $line1[4]
              
        $diaHoy = (get-date).Day
        $mesHoy = (get-date).Month
        $fecha = (Get-Date).Date               
        
        if ($diaHoy -eq $diaHappy)
            {
            if ($mesHoy -eq $mesHappy)
                {
                    Add-Content E:\SMScript\Happy\Correo.txt "$correo"
                 }
                else
                {
                $aviso = 'NoEnviarCorreo'
                }
            }
            else
            {
            $aviso = 'NoEnviarCorreo'
            }
        }
}
finally 
{
    $reader.Close()
}