<#
La condicion se evalua al principio, si la condicion es falsa la primera vez,
el bloque de codigo no se ejecuta
for, while, Do - While
#>

# FOR

for (inicializacion; condicion; incremento){
    Bloque de codigo
}

# Ejemplo

for($i=1, $i -le 10; $i++){
    Write-Host $i
}

# WHILE

while(condicion){
    Bloque de codigo
}

# Ejemplo while infinito reloj

while($True){
	    clear-host
	    get-date
	    Start-Sleep -Seconds 1
}

# DO

do {
    Bloque de codigo
}while(condicion)

<#
La condicion se evalua al final, el bloque de codigo se ejcuta siempre, al menos la 
primera vez
#>

# DO

do {
    Bloque de codigo
}until(condicion)

# Ejemplo 1
 
# Ejemplo Reloj

function reloj{
param($intervalo = 1)
	Do
	{
	    clear-host
	    get-date
	    Start-Sleep -Seconds $intervalo
	} until ( [System.Console]::KeyAvailable )
        [System.Console]::ReadKey($true) | Out-Null
}
reloj