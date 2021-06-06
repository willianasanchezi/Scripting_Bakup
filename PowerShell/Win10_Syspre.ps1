Set-ExecutionPolicy Unrestricted
import-module appx
import-module dism
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
Get-AppxPackage *Appconnector* | Remove-AppxPackage
Get-AppxPackage *windowscalculator* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *windowscamera* | Remove-AppxPackage
Get-AppxPackage *CandyCrushSaga* | Remove-AppxPackage
Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *zunemusic* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-AppxPackage *Messaging* | Remove-AppxPackage
Get-AppxPackage *solitairecollection* | Remove-AppxPackage
Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage
Get-AppxPackage *bingfinance* | Remove-AppxPackage
Get-AppxPackage *zunevideo* | Remove-AppxPackage
Get-AppxPackage *bingnews* | Remove-AppxPackage
Get-AppxPackage *onenote* | Remove-AppxPackage
Get-AppxPackage *people* | Remove-AppxPackage
Get-AppxPackage *CommsPhone* | Remove-AppxPackage
Get-AppxPackage *windowsphone* | Remove-AppxPackage
Get-AppxPackage *photos* | Remove-AppxPackage
Get-AppxPackage *WindowsScan* | Remove-AppxPackage
Get-AppxPackage *bingsports* | Remove-AppxPackage
Get-AppxPackage *windowsstore* | Remove-AppxPackage
Get-AppxPackage *Office.Sway* | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
Get-AppxPackage *bingweather* | Remove-AppxPackage
Get-AppxPackage *xboxapp* | Remove-AppxPackage
Get-AppxPackage *XboxOneSmartGlass* | Remove-AppxPackage
Get-AppxPackage *FarmVille2CountryEscape* | Remove-AppxPackage
Get-AppxPackage *TuneInRadio* | Remove-AppxPackage
Get-AppxPackage *Netflix* | Remove-AppxPackage
Get-AppxPackage *DrawboardPDF* | Remove-AppxPackage
Get-AppxPackage *CandyCrushSodaSaga* | Remove-AppxPackage
# Adicional
Get-AppxPackage *BrokerPlugin* | Remove-AppxPackage
Get-AppxPackage *CloudExperienceHost* | Remove-AppxPackage
Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage
Get-AppxPackage *PPIProjection* | Remove-AppxPackage
Get-AppxPackage *ChxApp* | Remove-AppxPackage
Get-AppxPackage *ContentDeliveryManager* | Remove-AppxPackage
Get-AppxPackage *SecondaryTileExperience* | Remove-AppxPackage
Get-AppxPackage *SecureAssessmentBrowser* | Remove-AppxPackage
Get-AppxPackage *XboxGameCallableUI* | Remove-AppxPackage
Get-AppxPackage *ContactSupport* | Remove-AppxPackage
Get-AppxPackage *MiracastView* | Remove-AppxPackage
Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage *StorePurchaseApp* | Remove-AppxPackage
Get-AppxPackage *OneConnect* | Remove-AppxPackage
Get-AppxPackage *MicrosoftStickyNotes* | Remove-AppxPackage
Get-AppxPackage | Out-GridView