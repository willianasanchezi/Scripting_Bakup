$query = "a"
Invoke-Command -ComputerName drosera.mintic.gov.co -ScriptBlock { 
    param ($query)
    Write-Host $query
  } -ArgumentList $query 