Configuration DemoWebSite {
    param ($MachineName)
 
    Node $MachineName {
        #Instalar el rol de IIS
        WindowsFeature IIS {
            Ensure = “Present”
            Name = “Web-Server”
        }
 
        #Instalar ASP.NET 4.5
        WindowsFeature ASP {
            Ensure = “Present”
            Name = “Web-Asp-Net45”
        }
    }
}
DemoWebsite –MachineName “Server01”