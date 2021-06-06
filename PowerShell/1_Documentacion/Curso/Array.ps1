<#
Tipos de array
https://www.youtube.com/watch?v=3cj6o9Hf9-o&list=PLn98b7UTDjb1h5_LCHXyeJR8nrPeTaSBM&index=9
#>

$array_vacio = @()
$enteros = @(1,2,3,4,5)
$enteros = 1,2,3,4,5
$consecutivos = 1..10
$caracteres = "a"."b","c","d"
$multi_tipo = @(1,2,3,'a','b')


$enteros = @(1,2,3,4,5)
Write-Host $enteros[0]
Write-Host $enteros[-1]

# Cantidad de elementos de un array
$array_nuevo = @(1,2,3,4)
$array_nuevo.Length
$array_nuevo.Count
$array_nuevo.IsFixedSize
$array_nuevo.IsReadOnly
$array_nuevo.IsSynchronized
$array_nuevo.LongLength
$array_nuevo.Rank
$array_nuevo.SyncRoot