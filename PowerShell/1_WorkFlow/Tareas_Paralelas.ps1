<# 
https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/26/powershell-workflows-the-basics/
#>
Clear-Host
workflow paralleltest {

 parallel {

   Get-CimInstance –ClassName Win32_OperatingSystem

   Get-Process –Name PowerShell*

   Get-CimInstance –ClassName Win32_ComputerSystem

   Get-Service –Name s*

  }

}
paralleltest

####################


workflow pingParalelo{
$Servidores = @("violeta.aitsoporte.local","eneldo.aitsoporte.local")
ForEach -Parallel ( $Servidor in $Servidores) 
    {
    Test-NetConnection $Servidor -port 3389
    } 
}
pingParalelo
