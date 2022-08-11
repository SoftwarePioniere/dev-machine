
Write-Host "=============================================================================================="

#Remove Apps
Write-Output "Removing Apps"

$apps = @(
        "*3DPrint*",
        "Microsoft.MixedReality.Portal",
        "Microsoft.Microsoft3DViewer",
        "Microsoft.WindowsFeedbackHub",
        "Microsoft.ZuneMusic",
        "Microsoft.SkypeApp",
        "Microsoft.GetHelp",
        "Microsoft.Office.OneNote",
        "Microsoft.MicrosoftOfficeHub",
        "Microsoft.XboxApp",
        "Microsoft.XboxGamingOverlay",
        "Microsoft.Getstarted",
        "Microsoft.ZuneVideo",
        "microsoft.windowscommunicationsapps"
         )


Foreach ($app in $apps) {
  Write-host "  Uninstalling:" $app
  Get-AppxPackage -allusers $app | Remove-AppxPackage
}