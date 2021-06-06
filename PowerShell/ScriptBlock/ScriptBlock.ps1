$query = "a"
Invoke-Command -ComputerName drosera.aitsoporte.local -ScriptBlock { 
    param ($query)
    Write-Host $query
  } -ArgumentList $query 