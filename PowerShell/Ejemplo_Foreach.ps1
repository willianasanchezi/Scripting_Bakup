#https://blogs.technet.microsoft.com/heyscriptingguy/2014/04/28/basics-of-powershell-looping-foreach/
$a = 5
$b = 6
$c = 7
$d = $a,$b,$c
Foreach ($i in $d)
{
$i + 5
}