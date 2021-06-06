Clear-Host
workflow tareasParalelas {
 parallel {
    Test-Connection -ComputerName 127.0.0.1
    Test-NetConnection -ComputerName 127.0.0.1 -Port 135
    Test-NetConnection -ComputerName 127.0.0.1 -Port 445
  }
}
tareasParalelas