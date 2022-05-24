# https://gist.github.com/Codebytes/29bf18015f6e93fca9421df73c6e512c

Write-Host "=============================================================================================="

#Install WinGet
#Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppPackage -name 'Microsoft.DesktopAppInstaller'
if (!$hasPackageManager -or [version]$hasPackageManager.Version -lt [version]"1.10.0.0") {
  "Installing winget Dependencies"
  Add-AppxPackage -Path 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'

  $releases_url = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'

  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $releases = Invoke-RestMethod -uri $releases_url
  $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1

  "Installing winget from $($latestRelease.browser_download_url)"
  Add-AppxPackage -Path $latestRelease.browser_download_url
}
else {
  "winget already installed"
}

Write-Host "=============================================================================================="

#Configure WinGet
Write-Output "Configuring winget"

#winget config path from: https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md#file-location
$settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json";
$settingsJson =
@"
    {
        // For documentation on these settings, see: https://aka.ms/winget-settings
        "experimentalFeatures": {
          "experimentalMSStore": true,
        }
    }
"@;
$settingsJson | Out-File $settingsPath -Encoding utf8

Write-Host "=============================================================================================="

#Install New apps
Write-Output "Installing Apps"
$apps = @(
  @{name = "Microsoft.AzureCLI" },
  @{name = "Microsoft.AzureStorageExplorer" },
  @{name = "Microsoft.DotNet.SDK.5" },
  @{name = "Microsoft.DotNet.SDK.6" },
  # @{name = "Microsoft.Office" },
  @{name = "Microsoft.PowerShell" },
  # @{name = "Microsoft.PowerToys" },
  @{name = "Microsoft.SQLServerManagementStudio" },
  @{name = "Microsoft.Teams" },
  @{name = "Microsoft.VisualStudioCode" },
  @{name = "Microsoft.WindowsTerminal"; source = "msstore" },
  @{name = "Adobe.Acrobat.Reader.32-bit" },
  @{name = "AdoptOpenJDK.OpenJDK.8" },
  @{name = "7zip.7zip" },
  @{name = "Bitwarden.Bitwarden" },
  @{name = "Docker.DockerDesktop" },
  @{name = "Git.Git" },
  @{name = "Google.Chrome" },
  @{name = "JetBrains.Toolbox" },
  @{name = "Mozilla.Firefox.ESR" },
  @{name = "Notepad2mod.Notepad2mod" },
  @{name = "Oracle.JavaRuntimeEnvironment" },
  @{name = "OpenJS.NodeJS.LTS"; version = '12.22.8' },
  @{name = "Postman.Postman" },
  @{name = "Terminals.Terminals" }
  # @{name = "PuTTY.PuTTY" },
  # @{name = "File-New-Project.EarTrumpet" },
  # @{name = "TechSmith.Snagit" },
  # @{name = "MongoDB.Compass.Community" },
  # @{name = "qishibo.AnotherRedisDesktopManager" },  
  # @{name = "Insomnia.Insomnia" },
  # @{name = "RustemMussabekov.Raindrop" }
  # @{name = "TeamViewer" ; version = '13.2.36224' }
  # @{name = "xxx" },
);

# 'curl',


# 'jdk8', ??
# 'gradle',

Foreach ($app in $apps) {
  $global:LASTEXITCODE = 0

  Write-Host "---"
  Write-Host $app.name

  
  $listApp = winget list --exact --accept-source-agreements -q $app.name
  
  if (![String]::Join("", $listApp).Contains($app.name)) {
    Write-host " Installing:" $app.name
  
    $p = @('install', '--exact', '--silent', '--accept-package-agreements')

    $cmd = 'winget'
    
    if ($null -ne $app.source) {
      $p += @('--source', $app.source)
    }
  
    if ($null -ne $app.version) {
      $p += @('--version'. $app.version )
    }
  
    $p += $app.name
  
    Write-Host "   $cmd $p"
    Write-Host '  --------------'
    & $cmd $p
    if ($LASTEXITCODE -ne 0) { throw 'error' }

  }
  else {
    Write-host " Upgrading: " $app.name

    # upgrade only if no version
    if ($null -eq $app.version) {
      $p = @('upgrade', '--exact', '--silent')
	    $p = @('upgrade')

      $cmd = 'winget'
      $p += $app.name

      Write-Host "   $cmd $p"
      Write-Host '  --------------'
      & $cmd $p
      Write-Host $LASTEXITCODE
      # if ($LASTEXITCODE -ne 0) { throw 'error' }  
    }
  }
}

Write-Host "=============================================================================================="

#Remove Apps
Write-Output "Removing Apps"

$apps = "*3DPrint*", "Microsoft.MixedReality.Portal"
Foreach ($app in $apps) {
  Write-host "  Uninstalling:" $app
  Get-AppxPackage -allusers $app | Remove-AppxPackage
}