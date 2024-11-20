[Cmdletbinding()]
Param(
  [string] $scope = 'admin'
  , [switch] $dryRun    
)

Write-Host "=============================================================================================="
Write-Output "Installing Winget Apps"
Write-Output "Scope: $scope"


$apps = @(

  @{name = 'Git.Git'; interactive = $true ; scope = 'admin' }
  # @{name = 'Git.Git';  override = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCANCEL /SP- /LOG /COMPONENTS='assoc,gitlfs,!ext' /o:PathOption=Cmd' ; scope = 'admin'  },
  , @{name = 'Microsoft.VisualStudioCode'; override = '/SILENT /mergetasks=''!runcode,addcontextmenufiles,addcontextmenufolders'''; scope = 'user' }
  , @{name = 'Microsoft.PowerShell' ; scope = 'admin' }
  , @{name = 'Microsoft.AzureCLI' ; scope = 'admin' }
  , @{name = 'Microsoft.Azure.StorageExplorer' ; scope = 'admin' }
  , @{name = 'Microsoft.DotNet.SDK.5' ; scope = 'admin' }
  , @{name = 'Microsoft.DotNet.SDK.6' ; scope = 'admin' }
  , @{name = 'Microsoft.DotNet.SDK.7' ; scope = 'admin' }
  , @{name = 'Microsoft.DotNet.SDK.8' ; scope = 'admin' }
  , @{name = 'Microsoft.DotNet.SDK.9' ; scope = 'admin' }
  , @{name = 'Microsoft.SQLServerManagementStudio' ; scope = 'admin' }
  , @{name = 'Microsoft.WindowsTerminal' ; scope = 'admin' }
  , @{name = 'Adobe.Acrobat.Reader.64-bit' ; scope = 'admin' }
  , @{name = 'Microsoft.OpenJDK.17' ; scope = 'admin' }
  , @{name = '7zip.7zip' ; scope = 'admin' }
  , @{name = 'Bitwarden.Bitwarden' ; scope = 'admin' }
  , @{name = 'Docker.DockerDesktop' ; scope = 'admin' }

  , @{name = 'Google.Chrome' ; scope = 'admin' }
  , @{name = 'JetBrains.Toolbox' ; scope = 'admin' }
  , @{name = 'Mozilla.Firefox.ESR' ; scope = 'admin' }
  , @{name = 'Notepad2mod.Notepad2mod' ; scope = 'admin' }

  , @{name = 'Postman.Postman' ; scope = 'admin' }
  , @{name = 'Terminals.Terminals' ; scope = 'admin' }

  , @{name = 'CoreyButler.NVMforWindows' ; scope = 'admin'; version = '1.1.11' }
  # , @{name = 'Schniz.fnm' ; scope = 'admin' }

  , @{name = 'FireDaemon.OpenSSL' ; scope = 'admin' }
  , @{name = 'cURL.cURL' ; scope = 'admin' }
  
  # , @{name = 'dotPDN.PaintDotNet' ; scope = 'admin' }
  , @{name = '3TSoftwareLabs.Robo3T' ; scope = 'admin' }
  
  , @{name = 'TechSmith.Snagit.2024' ; scope = 'admin' }
  , @{name = 'Microsoft.PowerToys' ; scope = 'admin' }
  
  # @{name = "Microsoft.PowerToys" }
  # @{name = "PuTTY.PuTTY" }
  # @{name = "File-New-Project.EarTrumpet" }
  # @{name = "TechSmith.Snagit" }
  # @{name = "MongoDB.Compass.Community" }
  # @{name = "qishibo.AnotherRedisDesktopManager" }
  # @{name = "Insomnia.Insomnia" }
  # @{name = "RustemMussabekov.Raindrop" }
  # @{name = "TeamViewer" ; version = '13.2.36224' }

);

Foreach ($app in $apps) {
  $global:LASTEXITCODE = 0

  Write-Host "---"
  Write-Host $app.name
  $appScope = $app.scope
  if (!$appScope) {
    $appScope = 'admin'
  }
  Write-host " Scope:" $appScope

  if ($appScope -eq $scope) {

    $listApp = winget list --exact --accept-source-agreements -q $app.name

    if (![String]::Join("", $listApp).Contains($app.name)) {
  		
      Write-host " Installing:" $app.name  

      $p = @('install', '--exact', '--accept-package-agreements')

      $cmd = 'winget'

      if ($null -eq $app.interactive) {
        $p += @('--silent')
      }

      if ($null -ne $app.nosilent) {
        if ($app.interactive -eq $true) {
          $p += @('--interactive')
        }
        else {
          $p += @('--silent')
        }
      }

      if ($null -ne $app.source) {
        $p += @('--source', $app.source)
      }

      if ($null -ne $app.version) {
        $p += @('--version', $app.version )
      }

      if ($null -ne $app.override) {
        $p += @('--override', $app.override )
      }

      $p += $app.name

      Write-Host "   $cmd $p"
      Write-Host '  --------------'
      if (!$dryRun) {
        & $cmd $p
        if ($LASTEXITCODE -ne 0) { throw 'error' }		
      }
    
    }
    else {
      Write-host " Upgrading: " $app.name

      # upgrade only if no version
      if ($null -eq $app.version) {
        $p = @('upgrade', '--exact', '--silent')
        $p = @('upgrade')

        $cmd = 'winget'
        $p += $app.name

        if ($null -ne $app.override) {
          $p += @('--override', $app.override )
        }

        Write-Host "   $cmd $p"
        Write-Host '  --------------'
      
        if (!$dryRun) {
          & $cmd $p
          Write-Host $LASTEXITCODE
        }
        # if ($LASTEXITCODE -ne 0) { throw 'error' }
      }
    }
  } else {
    Write-Host " Skipping: " $app.name
  }
}
