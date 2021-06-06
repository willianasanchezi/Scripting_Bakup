using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management.Automation;

namespace PS01
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                using (PowerShell ps = PowerShell.Create())
                {
                    //var resultados = ps.AddScript("Get-ADUser –filter {Enabled -eq 'True'} -properties * | select-object Name,dateOfBirth,POBox,enabled").Invoke();
                    var resultados = ps.AddScript("get-service").Invoke();
                    foreach (var resultado in resultados)
                    {
                        var nombre = resultado.Properties["Name"].Value.ToString();
                        var estado = resultado.Properties["Status"].Value.ToString();
                        var display = resultado.Properties["DisplayName"].Value.ToString();
                        Console.WriteLine(nombre + " | " + estado + " | "+ display);

                    }
                    Console.ReadKey();
                }

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
