<#
https://www.sharepointdiary.com/2016/09/sharepoint-online-download-file-from-library-using-powershell.html
https://www.sharepointdiary.com/2016/09/sharepoint-online-download-file-from-library-using-powershell.html#ixzz6NqNqQMuc
#>


<# 
SharePoint Online PowerShell to Download File from Library
#>

#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 
Function Download-FileFromLibrary()
{ 
    param
    (
        [Parameter(Mandatory=$true)] [string] $SiteURL,
        [Parameter(Mandatory=$true)] [string] $SourceFile,
        [Parameter(Mandatory=$true)] [string] $TargetFile
    )
 
    Try {
        #Setup Credentials to connect
        $Cred= Get-Credential
        $Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)
 
        #Setup the context
        $Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
        $Ctx.Credentials = $Credentials
     
        #sharepoint online powershell download file from library
        $FileInfo = [Microsoft.SharePoint.Client.File]::OpenBinaryDirect($Ctx,$SourceFile)
        $WriteStream = [System.IO.File]::Open($TargetFile,[System.IO.FileMode]::Create)
        $FileInfo.Stream.CopyTo($WriteStream)
        $WriteStream.Close()
 
        Write-host -f Green "File '$SourceFile' Downloaded to '$TargetFile' Successfully!" $_.Exception.Message
  }
    Catch {
        write-host -f Red "Error Downloading File!" $_.Exception.Message
    }
}
 
#Set parameter values
$SiteURL="https://crescent.sharepoint.com/sites/sales/"
$SourceFile="/sites/Sales/Shared Documents/Crescent Legal App Requirements.docx"  #Relative URL 
$TargetFile="C:\Temp\LegalDoc.docx"
 
#Call the function to download file 
Download-FileFromLibrary -SiteURL $SiteURL -SourceFile $SourceFile -TargetFile $TargetFile


<#
Download a File from SharePoint Online using PnP PowerShell 
#>

#Config Variables
$SiteURL = "https://crescenttech.sharepoint.com/sites/marketing"
$FileRelativeURL = "/sites/Marketing/Shared Documents/Discloser Asia.docx"
$DownloadPath ="C:\Temp"
 
#Get Credentials to connect
$Cred = Get-Credential
 
Try {
    #Connect to PNP Online
    Connect-PnPOnline -Url $SiteURL -Credentials $Cred
     
    #powershell download file from sharepoint online
    Get-PnPFile -Url $FileRelativeURL -Path $DownloadPath -AsFile
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}

