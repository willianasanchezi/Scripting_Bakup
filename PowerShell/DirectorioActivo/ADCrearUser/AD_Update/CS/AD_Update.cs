using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Management.Automation;
using System.Diagnostics;
using System.IO;
using System.Threading;

namespace PS01
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var rutaPS = @"C:\Windows\Temp\AD.ps1";
                //var rutaCSV = @"E:\SMFiles\Years\";
                //var exportar = @"C:\Windows\Temp\Usuarios.csv";
                //var exportar = @"E:\SMFiles\Years\Usuarios.csv";
                File.Delete(rutaPS);
                Thread.Sleep(5000);

                if (!File.Exists(rutaPS))
                {
                    // Crear archivo.
                    using (StreamWriter archivo = File.CreateText(rutaPS))
                    {
                        archivo.WriteLine("Remove-Item E:\\SMFiles\\Years\\*.*");
                        archivo.WriteLine("$dia = Get-Date -Format \"dd\"");
                        archivo.WriteLine("$mes = Get-Date -Format \"MM\"");
                        archivo.WriteLine("$fecha = $mes + \"/\" + $dia");
                        archivo.WriteLine("$fecha");
                        archivo.WriteLine("Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object Name,POBox,UserPrincipalName,dateOfBirth | where-object {$_.dateOfBirth -like \"*$fecha*\" } | Export-Csv E:\\SMFiles\\Years\\Usuarios.csv -Encoding UTF8");
                        archivo.WriteLine("$rutaArchivo = \"E:\\SMFiles\\Years\\Usuarios.csv\"");
                        archivo.WriteLine("$antiguo = '\"\' ");
                        archivo.WriteLine("$nuevo = ''");
                        archivo.WriteLine("(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo");
                        archivo.WriteLine("Write-Host $antiguo $nuevo");
                        archivo.WriteLine("$antiguo = \"enabled, Office, Name, POBox, UserPrincipalName, dateOfBirth\"");
                        archivo.WriteLine("$nuevo = \"false, Test, Test, Test, wsanchez@coem.co,''\"");
                        archivo.WriteLine("(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo");
                        archivo.WriteLine("Write-Host $antiguo $nuevo ");
                        archivo.WriteLine("$antiguo = \"#TYPE Selected.Microsoft.ActiveDirectory.Management.ADUser\"");
                        archivo.WriteLine("$nuevo = \"enabled, Office, Name, POBox, UserPrincipalName, dateOfBirth\"");
                        archivo.WriteLine("(Get-Content -path $rutaArchivo) -replace $antiguo, $nuevo | Set-Content $rutaArchivo");
                        archivo.WriteLine("Get-Content $rutaArchivo | Set-Content -Encoding utf8 E:\\SMFiles\\Years\\UsuariosUTF8.csv");
                        //sw.WriteLine("Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth | Export-Csv -LiteralPath " + exportar + " -Encoding UTF8 ");
                        // Get-ADUser -filter {Enabled -eq 'True'} -properties * | select-object enabled,Office,Name,POBox,UserPrincipalName,dateOfBirth | Export-Csv C:\Windows\Temp\Usuarios.csv -Encoding UTF8
                        //archivo.WriteLine(@"");

                        /*
                         archivo.WriteLine(
                        Inicio Cambio Mayo 22 de 2020    
                        */
                        archivo.WriteLine("Start-Sleep -s 15");
                        archivo.WriteLine("# Details of the runbook we are going to run");
                        archivo.WriteLine("$rbid = \"f8de3eb0-0565-40ac-8d2c-50951e972b2c\"");  
                        archivo.WriteLine("<# $rbParameters = @{ \"00000000-0000-0000-00000000000000002\" = \"This is the value for Param1.\"; \" 00000000 - 0000 - 0000 - 00000000000000003\" = \" This is the value for Param2.\"} #> ") ;
                        archivo.WriteLine("# Create the request object");
                        archivo.WriteLine("$request = [System.Net.HttpWebRequest]::Create(\"http://localhost:81/Orchestrator2012/Orchestrator.svc/Jobs\")");
                        archivo.WriteLine("# Set the credentials to default or prompt for credentials");
                        archivo.WriteLine("$request.UseDefaultCredentials = $true");
                        archivo.WriteLine("# $request.Credentials = Get-Credential");
                        archivo.WriteLine("# Build the request header");
                        archivo.WriteLine("$request.Method = \"POST\"");
                        archivo.WriteLine("$request.UserAgent=\"Microsoft ADO.NET Data Services\"");
                        archivo.WriteLine("$request.Accept=\"application/atom+xml,application/xml\"");
                        archivo.WriteLine("$request.ContentType=\"application/atom+xml\"");
                        archivo.WriteLine("$request.KeepAlive=$true");
                        archivo.WriteLine("$request.Headers.Add(\"Accept-Encoding\",\"identity\")");
                        archivo.WriteLine("$request.Headers.Add(\"Accept-Language\",\"en-US\")");
                        archivo.WriteLine("$request.Headers.Add(\"DataServiceVersion\",\"1.0;NetFx\")");
                        archivo.WriteLine("$request.Headers.Add(\"MaxDataServiceVersion\",\"2.0;NetFx\")");
                        archivo.WriteLine("$request.Headers.Add(\"Pragma\",\"no-cache\")");
                        archivo.WriteLine("# If runbook servers are specified, format the string");
                        archivo.WriteLine("<#");
                        archivo.WriteLine("$rbServerString=\"\"");
                        archivo.WriteLine("if(-not[string]::IsNullOrEmpty($RunbookServers))");
                        archivo.WriteLine("{");
                        archivo.WriteLine("$rbServerString = -join(\"< d:RunbookServers>\",$RunbookServers,\"</d:RunbookServers>\")");
                        archivo.WriteLine("}");
                        archivo.WriteLine("#>");
                        archivo.WriteLine("# Format the Runbook parameters, if any");
                        archivo.WriteLine("<#");
                        archivo.WriteLine("$rbParamString = \"\"");
                        archivo.WriteLine("if ($rbParameters -ne $null) {");
                        archivo.WriteLine("# Format the param string from the Parameters hashtable");
                        archivo.WriteLine("$rbParamString = \"< d:Parameters><![CDATA[<Data>\"");
                        archivo.WriteLine("foreach ($p in $rbParameters.GetEnumerator())");
                        archivo.WriteLine("{");
                        archivo.WriteLine("#$rbParamString = -join ($rbParamString,\" & lt;Parameter&gt;&lt;ID&gt;{\",$p.key,\"}&lt;/ID&gt;&lt;Value&gt;\",$p.value,\"&lt;/Value&gt;&lt;/Parameter&gt;\")");
                        archivo.WriteLine("$rbParamString = -join($rbParamString, \" < Parameter><ID>{\",$p.key, \"}</ID><Value>\",$p.value, \"</Value></Parameter> \")");
                        archivo.WriteLine("}");
                        archivo.WriteLine("$rbParamString += \"</Data>]]></d:Parameters>\"");
                        archivo.WriteLine("}");
                        archivo.WriteLine("#>");
                        archivo.WriteLine("# Build the request body");
                        archivo.WriteLine("$requestBody=@\"");
                        archivo.WriteLine("<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>");
                        archivo.WriteLine("<entry xmlns:d=\"http://schemas.microsoft.com/ado/2007/08/dataservices\" xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\" xmlns=\"http://www.w3.org/2005/Atom\">");
                        archivo.WriteLine("<content type=\"application/xml\">");
                        archivo.WriteLine("<m:properties>");
                        archivo.WriteLine("<d:RunbookId m:type=\"Edm.Guid\">$rbid </d:RunbookId>");
                        archivo.WriteLine("$rbserverstring");
                        archivo.WriteLine("$rbparamstring");
                        archivo.WriteLine("</m:properties>");
                        archivo.WriteLine("</content>");
                        archivo.WriteLine("</entry>");
                        archivo.WriteLine("\"@");
                        archivo.WriteLine("#Create a request stream from the request");
                        archivo.WriteLine("$requestStream = new-object System.IO.StreamWriter $Request.GetRequestStream()");
                        archivo.WriteLine("# Sends the request to the service");
                        archivo.WriteLine("$requestStream.Write($RequestBody)");
                        archivo.WriteLine("$requestStream.Flush()");
                        archivo.WriteLine("$requestStream.Close()");
                        archivo.WriteLine("# Get the response from the request");
                        archivo.WriteLine("[System.Net.HttpWebResponse] $response = [System.Net.HttpWebResponse] $Request.GetResponse()");
                        archivo.WriteLine("# Write the HttpWebResponse to String");
                        archivo.WriteLine("$responseStream = $Response.GetResponseStream()");
                        archivo.WriteLine("$readStream = new-object System.IO.StreamReader $responseStream");
                        archivo.WriteLine("$responseString = $readStream.ReadToEnd()");
                        archivo.WriteLine("# Close the streams");
                        archivo.WriteLine("$readStream.Close()");
                        archivo.WriteLine("$responseStream.Close()");
                        archivo.WriteLine("# Get the ID of the resulting job");
                        archivo.WriteLine("if ($response.StatusCode -eq \'Created\')");
                        archivo.WriteLine("{");
                        archivo.WriteLine("$xmlDoc = [xml]$responseString");
                        archivo.WriteLine("$jobId = $xmlDoc.entry.content.properties.Id.InnerText");
                        archivo.WriteLine("Write-Host \"Successfully started runbook. Job ID: \"$jobId");
                        archivo.WriteLine("}");
                        archivo.WriteLine("else");
                        archivo.WriteLine("{");
                        archivo.WriteLine("Write-Host \"Could not start runbook. Status: \" $response.StatusCode");
                        archivo.WriteLine("}");

                        /*
                        Fin Cambio Mayo 22 de 2020    
                        */

                    }

                    Console.WriteLine("Crea archivo");

                    var iniciarProceso = new ProcessStartInfo()
                    {
                        FileName = "powershell.exe",
                        Arguments = $"-NoProfile -ExecutionPolicy unrestricted \"{rutaPS}\"",
                        UseShellExecute = false
                    };
                    Process.Start(iniciarProceso).WaitForExit();
                    // WaitForExit espera indefinidamente hasta que termina el proceso
                    //Console.WriteLine("Finaliza");
                    //Console.ReadKey();
                    Thread.Sleep(5000);
                    File.Delete(rutaPS);
                }
                else
                {
                    File.Delete(rutaPS);
                }               
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
