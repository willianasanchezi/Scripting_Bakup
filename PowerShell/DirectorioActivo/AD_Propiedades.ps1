Import-Module ActiveDirectory
# Atributos y propiedades de un usuario
Get-ADUser -Identity wsanchez -properties * | select *
# Grupos a los que pertenece un usuario
Get-ADUser -Identity wsanchez -properties MemberOf | select -ExpandProperty MemberOf


<# Propiedades usuario #>
PS C:\Windows\system32> Import-Module ActiveDirectory
PS C:\Windows\system32> Get-ADUser -Identity wsanchez -properties * | select *


AccountExpirationDate                : 1/01/2021 12:00:00 a.m.
accountExpires                       : 132539508000000000
AccountLockoutTime                   :
AccountNotDelegated                  : False
adminCount                           : 1
AllowReversiblePasswordEncryption    : False
AuthenticationPolicy                 : {}
AuthenticationPolicySilo             : {}
BadLogonCount                        : 0
badPasswordTime                      : 132463845204201239
badPwdCount                          : 0
c                                    : CO
CannotChangePassword                 : False
CanonicalName                        : mintic.gov.co/Cuentas/Administracion/Administradores/William Antonio Sanchez
                                       Ibañez
Certificates                         : {}
City                                 : Bogotá
CN                                   : William Antonio Sanchez Ibañez
co                                   : Colombia
codePage                             : 0
Company                              : MinTic
CompoundIdentitySupported            : {False}
Country                              : CO
countryCode                          : 170
Created                              : 11/04/2016 8:01:58 a.m.
createTimeStamp                      : 11/04/2016 8:01:58 a.m.
dateOfBirth                          : 7/12/1975 7:03:10 a.m.
Deleted                              :
Department                           :
Description                          : Profesional Especializado
DisplayName                          : William Antonio Sanchez Ibañez
DistinguishedName                    : CN=William Antonio Sanchez
                                       Ibañez,OU=Administradores,OU=Administracion,OU=Cuentas,DC=mintic,DC=gov,DC=co
Division                             :
DoesNotRequirePreAuth                : False
dSCorePropagationData                : {19/12/2019 1:38:29 p.m., 18/12/2019 7:09:02 p.m., 21/05/2019 9:54:02 p.m.,
                                       30/04/2019 7:07:47 p.m....}
EmailAddress                         : wsanchez@mintic.gov.co
EmployeeID                           : Controles Emp
EmployeeNumber                       : 31/12/2020
Enabled                              : True
Fax                                  :
GivenName                            : Willian Antonio
HomeDirectory                        :
HomedirRequired                      : False
HomeDrive                            :
HomePage                             : www.aitsoporte.local
HomePhone                            :
Initials                             :
instanceType                         : 4
isDeleted                            :
KerberosEncryptionType               : {None}
l                                    : Bogotá
LastBadPasswordAttempt               : 5/10/2020 10:15:20 a.m.
LastKnownParent                      :
lastLogoff                           : 0
lastLogon                            : 132465849814666160
LastLogonDate                        : 10/10/2020 2:11:29 p.m.
lastLogonTimestamp                   : 132468306894551496
LockedOut                            : False
lockoutTime                          : 0
logonCount                           : 46
logonHours                           : {255, 255, 255, 255...}
LogonWorkstations                    :
mail                                 : wsanchez@mintic.gov.co
Manager                              : CN=Arleth Patricia Saurith Contreras,OU=usuarios,OU=Oficina de Tecnologías de
                                       la Información,OU=Cuentas,DC=mintic,DC=gov,DC=co
MemberOf                             : {CN=USUARIOLMS,OU=Grupos,OU=Cuentas,DC=mintic,DC=gov,DC=co,
                                       CN=Group_0b64b8eb-7d3a-4eec-b6ac-da4569be2da9,DC=mintic,DC=gov,DC=co,
                                       CN=SCSMPortalAREditar,OU=Grupos,OU=Cuentas,DC=mintic,DC=gov,DC=co,
                                       CN=SCSMPortalARRechazar,OU=Grupos,OU=Cuentas,DC=mintic,DC=gov,DC=co...}
MNSLogonAccount                      : False
MobilePhone                          :
Modified                             : 10/10/2020 2:20:37 p.m.
modifyTimeStamp                      : 10/10/2020 2:20:37 p.m.
msDS-ExternalDirectoryObjectId       : User_69be4891-e535-4959-a768-fb9eb485d8eb
msDS-SupportedEncryptionTypes        : 0
msDS-User-Account-Control-Computed   : 0
msExchArchiveStatus                  : 1
msExchSafeSendersHash                : {86, 41, 160, 29...}
msExchUserHoldPolicies               : {UniH4cc5a34f-ca28-4977-b48e-677b05f024dc,
                                       98E9BABD09A04bcf8455A58C2AA74182Unlimit}
msRTCSIP-DeploymentLocator           : sipfed.online.lync.com
msRTCSIP-FederationEnabled           : True
msRTCSIP-InternetAccessEnabled       : True
msRTCSIP-OptionFlags                 : 257
msRTCSIP-PrimaryHomeServer           : CN=Lc Services\0ADEL:92505add-c943-47c9-8f25-21cb29eb537a,CN=Deleted
                                       Objects,CN=Configuration,DC=mintic,DC=gov,DC=co
msRTCSIP-PrimaryUserAddress          : sip:wsanchez@mintic.gov.co
msRTCSIP-UserEnabled                 : True
Name                                 : William Antonio Sanchez Ibañez
nTSecurityDescriptor                 : System.DirectoryServices.ActiveDirectorySecurity
ObjectCategory                       : CN=Person,CN=Schema,CN=Configuration,DC=mintic,DC=gov,DC=co
ObjectClass                          : user
ObjectGUID                           : e9d26fd8-fb93-466c-aaa0-96d0b6f04e70
objectSid                            : S-1-5-21-906791275-476758700-3757903968-2433
Office                               : Oficina De Tecnologias De La Informacion
OfficePhone                          : 3155
Organization                         :
OtherName                            :
PasswordExpired                      : False
PasswordLastSet                      : 16/11/2019 6:37:51 p.m.
PasswordNeverExpires                 : True
PasswordNotRequired                  : False
physicalDeliveryOfficeName           : Oficina De Tecnologias De La Informacion
POBox                                : Hombre
PostalCode                           : 79837017
postOfficeBox                        : {Hombre}
PrimaryGroup                         : CN=Domain Users,CN=Users,DC=mintic,DC=gov,DC=co
primaryGroupID                       : 513
PrincipalsAllowedToDelegateToAccount : {}
ProfilePath                          :
ProtectedFromAccidentalDeletion      : False
proxyAddresses                       : {x500:/o=ExchangeLabs/ou=Exchange Administrative Group
                                       (FYDIBOHF23SPDLT)/cn=Recipients/cn=user313d01a5, SMTP:wsanchez@mintic.gov.co,
                                       smtp:wsanchez@mintic.onmicrosoft.gov.co, sip:wsanchez@mintic.gov.co}
pwdLastSet                           : 132184210715554421
SamAccountName                       : wsanchez
sAMAccountType                       : 805306368
ScriptPath                           :
sDRightsEffective                    : 15
ServicePrincipalNames                : {}
SID                                  : S-1-5-21-906791275-476758700-3757903968-2433
SIDHistory                           : {}
SmartcardLogonRequired               : False
sn                                   : Sanchez Ibañez
st                                   : Piso 3
State                                : Piso 3
StreetAddress                        : Edificio Murillo Toro, Cra 8 entre calles 12 y 13
                                       GR695445 Activación
Surname                              : Sanchez Ibañez
telephoneNumber                      : 3155
Title                                : Proveedor
TrustedForDelegation                 : False
TrustedToAuthForDelegation           : False
UseDESKeyOnly                        : False
userAccountControl                   : 66048
userCertificate                      : {}
UserPrincipalName                    : wsanchez@mintic.gov.co
uSNChanged                           : 26211782
uSNCreated                           : 19153
whenChanged                          : 10/10/2020 2:20:37 p.m.
whenCreated                          : 11/04/2016 8:01:58 a.m.
wWWHomePage                          : www.aitsoporte.local
PropertyNames                        : {AccountExpirationDate, accountExpires, AccountLockoutTime,
                                       AccountNotDelegated...}
AddedProperties                      : {}
RemovedProperties                    : {}
ModifiedProperties                   : {}
PropertyCount                        : 132



PS C:\Windows\system32>