Clear-Host
<#
About For
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_for?view=powershell-5.1
For (<init>; <condition>; <repeat>) {<command_block>}

<init> Valor con el que inicia
<condition> Condiciones en este caso que sea menor a 1000
<repear> que por ejemplo muestre de 100 en 100, inicia en 1 pasa a 101, 201, 301 etc
{<command_block>} de acuerdo a las condiciones que se debe ejecutar
#>
For ($i = 1; $i -le 1000; $i+=500) { $i }


#
for (>init>; <condition>; <repeat>)
{<statement list>}


#
$ofs=",";$rs = "rs"; $cs = "cs"; for ($r = $rs, $c = $cs; $true;)
{ "r is '$r' and c is '$c'"; break }


#
$i = 1
for (;;){Write-Host $i}


#
for (;;){$i++; Write-Host $i}


#
$i=1
for (;;$i++){Write-Host $i}


#
$i=1
for(;$i -le 10;$i++){Write-Host $i}


#
for($i=1; $i -le 10; $i++){Write-Host $i}


#
for (<init>
  <condition>
  <repeat>){
  <statement list>
}


#
for ($i = 0; $i -ile 20; $i += 2) {Write-Host $i}
