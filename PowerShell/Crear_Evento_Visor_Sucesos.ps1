Write-EventLog -EventId 1309 -LogName System -Message Test -Source Time-Service -EntryType Information
Write-EventLog -EventId 23 -LogName System -Message Test -Source Hyper-V-VmSwitch -ComputerName DESKTOP-MUGMMAN.mintic.gov.co -EntryType Information
Write-EventLog -LogName System -Source EventLog -EntryType Information -EventId 1389 -Message "SYSADMIT TEST EVENT"
Write-EventLog -LogName System -Source EventLog -EntryType Information -EventId 1389 -Message "Test"
Write-EventLog -LogName Application -Source "ASP.NET 4.0.30319.0" -EntryType Information -EventId 1389 -Message "Test"
Write-EventLog -EventId 1315 -LogName Application -Message Test -Source "ASP.NET 4.0.30319.0" -ComputerName zurron.mincomunicaciones.gov.co -EntryType Information
Test-ComputerSecureChannel -Server nogal.mintic.gov.co
Test-ComputerSecureChannel -Server nogal.mintic.gov.co -WhatIf
