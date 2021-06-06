$snmp = new-object -ComObject olePrn.OleSNMP
$snmp.open('10.6.6.20','M1NT1CR0')
$snmp.Get(".1.3.6.1.2.1.1.5.0")

Test-NetConnection 190.145.189.98 -port 161