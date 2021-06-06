
$variable = "RB1234"
switch -Wildcard ($variable)
       {

           "GR*" {"GR."}
           "AR*" {"AR."}
           "AM*" {"AM."}
           "RB*" {"RB."}
       }