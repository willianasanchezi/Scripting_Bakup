<#
https://docs.microsoft.com/es-es/azure/automation/automation-first-runbook-textual
https://docs.microsoft.com/es-es/azure/automation/automation-powershell-workflow
https://docs.microsoft.com/es-es/azure/automation/automation-child-runbooks
https://docs.microsoft.com/en-us/powershell/module/psworkflow/about/about_inlinescript?view=powershell-5.1
#>

workflow MyFirstRunbook-Workflow
{
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Connect-AzureRmAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

$AzureContext = Select-AzureRmSubscription -SubscriptionId $ServicePrincipalConnection.SubscriptionID

Start-AzureRmVM -Name 'VMName' -ResourceGroupName 'ResourceGroupName' -AzureRmContext $AzureContext
}

<#
https://docs.microsoft.com/es-es/azure/automation/automation-powershell-workflow
#>

workflow Test-Workflow
{
# Abrir www.google.com con Internet Explorer
  $ie = InlineScript {
    $ie = New-Object -ComObject InternetExplorer.Application -property @{navigate2="www.google.com"}

    $ie.Visible = $true
  }

  $ie
}

Test-Workflow

<##>

Workflow Test-Runbook
{
   Get-Service
}
Test-Runbook