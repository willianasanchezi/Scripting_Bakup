@echo off
echo Subir SERVICIOS de Windows > SC_Prerequisitos_Client.log

echo Alerter >> SC_Prerequisitos_Client.log
sc query Alerter >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Alerter >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Alerter /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Alerter start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Alerter >> SC_Prerequisitos_Client.log
sc query Alerter >> SC_Prerequisitos_Client.log 

echo Automatic Updates >> SC_Prerequisitos_Client.log
sc query wuauserv >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\wuauserv >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\wuauserv /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config wuauserv start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start wuauserv >> SC_Prerequisitos_Client.log
sc query wuauserv >> SC_Prerequisitos_Client.log

echo Background Intelligent Transfer Service >> SC_Prerequisitos_Client.log
sc query BITS >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\BITS >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\BITS /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config BITS start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start BITS >> SC_Prerequisitos_Client.log
sc query BITS >> SC_Prerequisitos_Client.log 

echo COM+ Event System >> SC_Prerequisitos_Client.log
sc query EventSystem >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\EventSystem >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\EventSystem /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config EventSystem start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start EventSystem >> SC_Prerequisitos_Client.log
sc query EventSystem >> SC_Prerequisitos_Client.log 

echo Computer Browser >> SC_Prerequisitos_Client.log
sc query Browser >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Browser >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Browser /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Browser start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Browser >> SC_Prerequisitos_Client.log
sc query Browser >> SC_Prerequisitos_Client.log

echo DCOM Server Process Launcher >> SC_Prerequisitos_Client.log
sc query DcomLaunch >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\DcomLaunch >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\DcomLaunch /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config DcomLaunch start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start DcomLaunch >> SC_Prerequisitos_Client.log
sc query DcomLaunch >> SC_Prerequisitos_Client.log

echo DHCP Client >> SC_Prerequisitos_Client.log
sc query Dhcp >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Dhcp >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Dhcp /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Dhcp start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Dhcp >> SC_Prerequisitos_Client.log
sc query Dhcp >> SC_Prerequisitos_Client.log 

echo DNS Client >> SC_Prerequisitos_Client.log
sc query Dnscache >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Dnscache >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Dnscache /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Dnscache start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Dnscache >> SC_Prerequisitos_Client.log
sc query Dnscache >> SC_Prerequisitos_Client.log 

echo Event Log >> SC_Prerequisitos_Client.log
sc query Eventlog >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Eventlog >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Eventlog /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Eventlog start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Eventlog >> SC_Prerequisitos_Client.log
sc query Eventlog >> SC_Prerequisitos_Client.log 

echo Net Logon >> SC_Prerequisitos_Client.log
sc query Netlogon >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Netlogon >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Netlogon /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Netlogon start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Netlogon >> SC_Prerequisitos_Client.log
sc query Netlogon >> SC_Prerequisitos_Client.log 

echo Network Connections >> SC_Prerequisitos_Client.log
sc query Netman >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Netman >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Netman /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Netman start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Netman >> SC_Prerequisitos_Client.log
sc query Netman >> SC_Prerequisitos_Client.log 

echo Performance Logs and Alerts >> SC_Prerequisitos_Client.log
sc query SysmonLog >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\SysmonLog >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\SysmonLog /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config SysmonLog start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start SysmonLog >> SC_Prerequisitos_Client.log
sc query SysmonLog >> SC_Prerequisitos_Client.log 

echo Plug and Play >> SC_Prerequisitos_Client.log
sc query PlugPlay >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\PlugPlay >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\PlugPlay /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config PlugPlay start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start PlugPlay >> SC_Prerequisitos_Client.log
sc query PlugPlay >> SC_Prerequisitos_Client.log 

echo Remote Procedure Call (RPC) >> SC_Prerequisitos_Client.log
sc query RpcSs >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\RpcSs >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\RpcSs /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config RpcSs start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start RpcSs >> SC_Prerequisitos_Client.log
sc query RpcSs >> SC_Prerequisitos_Client.log 

echo Remote Registry >> SC_Prerequisitos_Client.log
sc query RemoteRegistry >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\RemoteRegistry >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\RemoteRegistry /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config RemoteRegistry start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start RemoteRegistry >> SC_Prerequisitos_Client.log
sc query RemoteRegistry >> SC_Prerequisitos_Client.log 

echo Server >> SC_Prerequisitos_Client.log
sc query LanmanServer >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\LanmanServer >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\LanmanServer /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config LanmanServer start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start LanmanServer >> SC_Prerequisitos_Client.log
sc query LanmanServer >> SC_Prerequisitos_Client.log 

echo Task Scheduler >> SC_Prerequisitos_Client.log
sc query Schedule >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\Schedule >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\Schedule /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config Schedule start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start Schedule >> SC_Prerequisitos_Client.log
sc query Schedule >> SC_Prerequisitos_Client.log 

echo TCP/IP NetBIOS Helper >> SC_Prerequisitos_Client.log
sc query LmHosts >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\LmHosts >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\LmHosts /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config LmHosts start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start LmHosts >> SC_Prerequisitos_Client.log
sc query LmHosts >> SC_Prerequisitos_Client.log

echo Windows Management Instrumentation >> SC_Prerequisitos_Client.log
sc query winmgmt >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\winmgmt >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\winmgmt /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config winmgmt start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start winmgmt >> SC_Prerequisitos_Client.log
sc query winmgmt >> SC_Prerequisitos_Client.log

echo Windows Time >> SC_Prerequisitos_Client.log
sc query W32Time >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\W32Time >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\W32Time /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config W32Time start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start W32Time >> SC_Prerequisitos_Client.log
sc query W32Time >> SC_Prerequisitos_Client.log

echo Workstation >> SC_Prerequisitos_Client.log
sc query lanmanworkstation >> SC_Prerequisitos_Client.log
reg query HKLM\SYSTEM\CurrentControlSet\services\lanmanworkstation >> SC_Prerequisitos_Client.log
reg add HKLM\SYSTEM\CurrentControlSet\services\lanmanworkstation /v Start /t REG_DWORD /d 2 /f >> SC_Prerequisitos_Client.log
sc config W32Time start= auto >> SC_Prerequisitos_Client.log
ping 127.0.0.1 >> SC_Prerequisitos_Client.log
sc start lanmanworkstation >> SC_Prerequisitos_Client.log
sc query lanmanworkstation >> SC_Prerequisitos_Client.log

echo Servicios Running >> SC_Prerequisitos_Client.log
sc queryex >> SC_Prerequisitos_Client.log

echo NET SHARE >> SC_Prerequisitos_Client.log
net share C$=C:\ >> SC_Prerequisitos_Client.log
net share ADMIN$ >> SC_Prerequisitos_Client.log
net share >> SC_Prerequisitos_Client.log

echo Finaliza proceso %date% %time% >> SC_Prerequisitos_Client.log
echo ........................................................... >> SC_Prerequisitos_Client.log