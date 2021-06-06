$job = Test-Connection -ComputerName (Get-Content "Servers.txt") -AsJob
if ($job.JobStateInfo.State -ne "Running") {$Results = Receive-Job $job}