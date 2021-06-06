# https://stackoverflow.com/questions/25888915/refreshing-web-page-using-powershell
#  $shell = New-Object -ComObject Shell.Application
#  $shell.Windows() | Get-Member

function Refresh-WebPages {
        param(
            $interval = 5
        )
        "Refreshing IE Windows every $interval seconds."
        "Press any key to stop."
        $shell = New-Object -ComObject Shell.Application
        do {
            'Refreshing ALL HTML'
            $shell.Windows() | 
                # Where-Object { $_.Document.url -like 'http://google*' }  |
                Where-Object { $_.Document.url -like 'http://templaurel/Reports_SCDWSR/Pages/Report.aspx?ItemPath=%2fSystemCenter%2fServiceManager%2fReportes%2fRequerimientos_hoy_semana_mes' }  | 
                ForEach-Object { $_.Refresh() }
            Start-Sleep -Seconds $interval
        } until ( [System.Console]::KeyAvailable )
        [System.Console]::ReadKey($true) | Out-Null
    }
    Refresh-WebPages