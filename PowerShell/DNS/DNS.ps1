# https://docs.microsoft.com/en-us/powershell/module/dnsclient/resolve-dnsname?view=winserver2012r2-ps
Resolve-DnsName -Name www.bing.com


<# DNS Cliente

Add-DnsClientNrptRule	
Adds a rule to the Name Resolution Policy Table (NRPT).

Clear-DnsClientCache	
Clears the contents of the DNS client cache.

Get-DnsClient	
Retrieves details of the network interfaces configured on a specified computer.

Get-DnsClientCache	
Retrieves the contents of the DNS client cache.

Get-DnsClientGlobalSetting	
Retrieves global DNS client settings like the suffix search list.

Get-DnsClientNrptGlobal	
Retrieves the Name Resolution Policy Table (NRPT) global settings.

Get-DnsClientNrptPolicy	
Retrieves the Name Resolution Policy Table (NRPT) configured on the computer.

Get-DnsClientNrptRule	
Retrieves the DNS client Name Resolution Policy Table (NRPT) rules.

Get-DnsClientServerAddress	
Gets DNS server IP addresses from the TCP/IP properties on an interface.

Register-DnsClient	
Registers all of the IP addresses on the computer onto the configured DNS server.

Remove-DnsClientNrptRule	
Removes the specified DNS client Name Resolution Policy Table (NRPT) rule.

Resolve-DnsName	
Performs a DNS name query resolution for the specified name.

Set-DnsClient	
Sets the interface specific DNS client configurations on the computer.

Set-DnsClientGlobalSetting	
Sets the DNS client global, non-interface specific, settings.

Set-DnsClientNrptGlobal	
Modifies the global Name Resolution Policy Table (NRPT) settings.

Set-DnsClientNrptRule	
Modifies a DNS client Name Resolution Policy Table (NRPT) rule for the specified namespace.

Set-DnsClientServerAddress	
Sets DNS server addresses associated with the TCP/IP properties on an interface.

#>

<# DNS Servidor
Add-DnsServerConditionalForwarderZone	
Adds a conditional forwarder to a DNS server.

Add-DnsServerDirectoryPartition	
Creates a DNS application directory partition.

Add-DnsServerForwarder	
Adds server level forwarders to a DNS server.

Add-DnsServerPrimaryZone	
Adds a primary zone to a DNS server.

Add-DnsServerResourceRecord	
Adds a resource record of a specified type to a specified DNS zone.

Add-DnsServerResourceRecordA	
Adds a type A resource record to a DNS zone.

Add-DnsServerResourceRecordAAAA	
Adds a type AAAA resource record to a DNS server.

Add-DnsServerResourceRecordCName	
Adds a type CNAME resource record to a DNS zone.

Add-DnsServerResourceRecordDS	
Adds a type DS resource record to a DNS zone.

Add-DnsServerResourceRecordDnsKey	
Adds a type DNSKEY resource record to a DNS zone.

Add-DnsServerResourceRecordMX	
Adds an MX resource record to a DNS server.

Add-DnsServerResourceRecordPtr	
Adds a type PTR resource record to a DNS server.

Add-DnsServerRootHint	
Adds root hints on a DNS server.

Add-DnsServerSecondaryZone	
Adds a DNS server secondary zone.

Add-DnsServerSigningKey	
Adds a KSK or ZSK to a signed zone.

Add-DnsServerStubZone	
Adds a DNS stub zone.

Add-DnsServerTrustAnchor	
Adds a trust anchor to a DNS server.

Add-DnsServerZoneDelegation	
Adds a new delegated DNS zone to an existing zone.

Clear-DnsServerCache	
Clears resource records from a cache on the DNS server.

Clear-DnsServerStatistics	
Clears all DNS server statistics or statistics for zones.

ConvertTo-DnsServerPrimaryZone	
Converts a zone to a DNS primary zone.

ConvertTo-DnsServerSecondaryZone	
Converts a primary zone or stub zone to a secondary zone.

Disable-DnsServerSigningKeyRollover	
Disables key rollover on an input key.

Enable-DnsServerSigningKeyRollover	
Enables rollover on the input key.

Export-DnsServerDnsSecPublicKey	
Exports DS and DNSKEY information for a DNSSEC-signed zone.

Export-DnsServerZone	
Exports contents of a zone to a file.

Get-DnsServer	
Retrieves a DNS server configuration.

Get-DnsServerCache	
Retrieves DNS server cache settings.

Get-DnsServerDiagnostics	
Retrieves DNS event logging details.

Get-DnsServerDirectoryPartition	
Gets a DNS application directory partition.

Get-DnsServerDnsSecZoneSetting	
Gets DNSSEC settings for a zone.

Get-DnsServerDsSetting	
Retrieves DNS Server Active Directory settings

Get-DnsServerEDns	
Gets EDNS configuration settings on a DNS sever.

Get-DnsServerForwarder	
Gets forwarder configuration settings on a DNS server.

Get-DnsServerGlobalNameZone	
Retrieves DNS server GlobalName zone configuration details.

Get-DnsServerGlobalQueryBlockList	
Gets a global query block list.

Get-DnsServerRecursion	
Retrieves DNS server recursion settings.

Get-DnsServerResourceRecord	
Gets resource records from a specified DNS zone.

Get-DnsServerRootHint	
Gets root hints on a DNS server.

Get-DnsServerScavenging	
Gets DNS aging and scavenging settings.

Get-DnsServerSetting	
Retrieves DNS server settings.

Get-DnsServerSigningKey	
Gets zone signing keys.

Get-DnsServerStatistics	
Retrieves DNS server statistics or statistics for zones.

Get-DnsServerTrustAnchor	
Gets trust anchors on a DNS server.

Get-DnsServerTrustPoint	
Gets trust points on a DNS server.

Get-DnsServerZone	
Gets details of DNS zones on a DNS server.

Get-DnsServerZoneAging	
Gets DNS aging settings for a zone.

Get-DnsServerZoneDelegation	
Gets the zone delegations of a DNS server zone.

Import-DnsServerResourceRecordDS	
Imports DS resource record information from a file.

Import-DnsServerRootHint	
Copies root hints from a DNS server.

Import-DnsServerTrustAnchor	
Imports a trust anchor for a DNS server.

Invoke-DnsServerSigningKeyRollover	
Initiates rollover of signing keys for the zone.

Invoke-DnsServerZoneSign	
Signs a DNS server zone.

Invoke-DnsServerZoneUnsign	
Unsigns a DNS server zone.

Register-DnsServerDirectoryPartition	
Registers a DNS server in a DNS application directory partition.

Remove-DnsServerDirectoryPartition	
Removes a DNS application directory partition.

Remove-DnsServerForwarder	
Removes server level forwarders from a DNS server.

Remove-DnsServerResourceRecord	
Removes specified DNS server resource records from a zone.

Remove-DnsServerRootHint	
Removes root hints from a DNS server.

Remove-DnsServerSigningKey	
Removes signing keys.

Remove-DnsServerTrustAnchor	
Removes a trust anchor from a DNS server.

Remove-DnsServerZone	
Removes a zone from a DNS server.

Remove-DnsServerZoneDelegation	
Removes a name server or delegation from a DNS zone.

Reset-DnsServerZoneKeyMasterRole	
Transfers the role of Key Master for a DNS zone.

Restore-DnsServerPrimaryZone	
Restores primary DNS zone contents from Active Directory or from a file.

Restore-DnsServerSecondaryZone	
Restores secondary zone information from its source.

Resume-DnsServerZone	
Resumes name resolution on a suspended zone.

Set-DnsServer	
Overwrites a DNS server configuration.

Set-DnsServerCache	
Modifies cache settings for a DNS server.

Set-DnsServerConditionalForwarderZone	
Changes settings for a DNS conditional forwarder.

Set-DnsServerDiagnostics	
Sets debugging and logging parameters.

Set-DnsServerDnsSecZoneSetting	
Changes settings for DNSSEC for a zone.

Set-DnsServerDsSetting	
Modifies DNS Active Directory settings.

Set-DnsServerEDns	
Changes EDNS settings on a DNS server.

Set-DnsServerForwarder	
Changes forwarder settings on a DNS server.

Set-DnsServerGlobalNameZone	
Changes configuration settings for a GlobalNames zone.

Set-DnsServerGlobalQueryBlockList	
Changes settings of a global query block list.

Set-DnsServerPrimaryZone	
Changes settings for a DNS primary zone.

Set-DnsServerRecursion	
Modifies recursion settings for a DNS server.

Set-DnsServerResourceRecord	
Changes a resource record in a DNS zone.

Set-DnsServerResourceRecordAging	
Begins aging of resource records in a specified DNS zone.

Set-DnsServerRootHint	
Replaces a list of root hints.

Set-DnsServerScavenging	
Changes DNS server scavenging settings.

Set-DnsServerSecondaryZone	
Change settings for a DNS secondary zone.

Set-DnsServerSetting	
Modifies DNS server settings.

Set-DnsServerSigningKey	
Changes settings of a signing key.

Set-DnsServerStubZone	
Changes settings for a DNS server stub zone.

Set-DnsServerZoneAging	
Configures DNS aging settings for a zone.

Set-DnsServerZoneDelegation	
Changes delegation settings for a child zone.

Show-DnsServerCache	
Shows the records in a DNS Server Cache.

Show-DnsServerKeyStorageProvider	
Returns a list of key storage providers.

Start-DnsServerScavenging	
Notifies a DNS server to attempt a search for stale resource records.

Start-DnsServerZoneTransfer	
Starts a zone transfer for a secondary DNS zone from master servers.

Step-DnsServerSigningKeyRollover	
Rolls over a KSK that is waiting for a parent DS update.

Suspend-DnsServerZone	
Suspends a zone on a DNS server.

Sync-DnsServerZone	
Checks the DNS server memory for changes, and writes them to persistent storage.

Test-DnsServer	
Tests that a specified computer is a functioning DNS server.

Test-DnsServerDnsSecZoneSetting	
Validates DNSSEC settings for a zone.

Unregister-DnsServerDirectoryPartition	
Deregisters a DNS server from a DNS application directory partition.

Update-DnsServerTrustPoint	
Updates all trust points in a DNS trust anchor zone.
#>