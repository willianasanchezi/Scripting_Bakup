# Opcion 1
$currentLocation = Split-Path -Parent $MyInvocation.MyCommand.Path;
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -Source $currentLocation -LimitAccess -All
# Opcion 2
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -Source C:\TI\Software\Net35\ -LimitAccess -All
# Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -Source C:\Windows\ConfigSC\ -LimitAccess -All
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -Source D:\sources\sxs\ -LimitAccess -All
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -Source C:\SM\sxs\ -LimitAccess -All
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -Source D:\sources\sxs -LimitAccess -All