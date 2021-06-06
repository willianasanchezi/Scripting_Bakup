# Roles a nivel de dominio
Get-ADDomain | select PDCEmulator,InfrastructureMaster,RIDMaster | fl
# Roles a nivel de bosque
Get-ADForest
Get-ADForest | select DomainNamingMaster,SchemaMaster | fl
# Catalogo Global
Get-ADForest | select GlobalCatalogs | fl