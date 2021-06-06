:: Roles fsmo comando netdom
netdom query fsmo

:: Roles fsmo comando ntdsutil
ntdsutil
roles
connections
connect to server NombreControladorDominio
quit
select operation target
?
list roles for connection server
quit

:: Ejemplo ::
C:\Users\Administrador>ntdsutil
ntdsutil: roles
fsmo maintenance: connections
server connections: connect to server AIT-SRVDC01
Enlazando a AIT-SRVDC01 ...
Conectado a AIT-SRVDC01 usando credenciales de usuario conectado localmente.
server connections: quit
fsmo maintenance: select operation target
select operation target: ?

 ?                             - Mostrar esta información de Ayuda
 Connections                   - Conectar a una instancia específica de AD DC/LDS
 Help                          - Mostrar esta información de Ayuda
 List current selections       - Mostrar el sitio/dominio/servidor/contexto de nombres actuales
 List domains                  - Muestra todos los dominios que tienen referencias cruzadas
 List domains in site          - Muestra los dominios del sitio seleccionado
 List Naming Contexts          - Muestra los contextos de nombres conocidos
 List roles for connected server - Hace una lista de los roles que conoce acerca del servidor conectado
 List servers for domain in site - Muestra los servidores del dominio y del sitio seleccionados
 List servers in site          - Muestra los servidores del sitio seleccionado
 List sites                    - Mostrar sitios de la empresa
 Quit                          - Volver al menú anterior
 Select domain %d              - Hacer que el dominio %d sea el dominio seleccionado
 Select Naming Context %d      - Hacer que el contexto de nombres %d sea el contexto de nombres seleccionado
 Select server %d              - Hacer que el servidor %d sea el servidor seleccionado
 Select site %d                - Hacer que el sitio %d sea el sitio seleccionado

select operation target: list roles for connected server
Servidor "AIT-SRVDC01" conoce los roles acerca de 5
Esquema: CN=NTDS Settings,CN=AIT-SRVDC01,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=local,DC=aitsoporte,DC=com
Maestro de nombres - CN=NTDS Settings,CN=AIT-SRVDC01,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=local,DC=aitsoporte,DC=com
PDC: CN=NTDS Settings,CN=AIT-SRVDC01,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=local,DC=aitsoporte,DC=com
RID: CN=NTDS Settings,CN=AIT-SRVDC01,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=local,DC=aitsoporte,DC=com
Infraestructura: CN=NTDS Settings,CN=AIT-SRVDC01,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=local,DC=aitsoporte,DC=com
select operation target: quit
fsmo maintenance: quit
ntdsutil: quit

C:\Users\Administrador>