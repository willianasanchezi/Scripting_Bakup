$fecha = '2017-12-31T05:00:00'
IF([string]::IsNullOrEmpty($fecha))
{
$aviso = 'Esta Vacia'
}
else
{
$aviso = 'Esta Llena'
}

$aviso