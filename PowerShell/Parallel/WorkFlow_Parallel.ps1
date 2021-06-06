$servidores =  "HISOPO","CAMAMILA","AJENJO","GUARANA","SOJA","VIOLETA","BALSAMO","ENELDO","TEMPLAUREL",
"CURCUMA","CARDAMOMO","ENEBRO","SAUCO","CITRONELA","AJEDREA","DUBOISIA","DORADILLA","DRABA","DRIADA",
"DROSERA","TABACO","AJEDREA"
workflow listado{
param([string[]]$servidores)
    foreach -parallel($servidor in $servidores)
    {
        Test-Connection $servidor -Count 1
    }
}
listado -servidores $servidores
