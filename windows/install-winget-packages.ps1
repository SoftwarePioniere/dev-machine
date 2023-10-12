Write-Host "=============================================================================================="
Write-Output "Installing Winget Apps"

$apps = @(

    @{name = 'Git.Git';  interactive = $true }
  # @{name = 'Git.Git';  override = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCANCEL /SP- /LOG /COMPONENTS='assoc,gitlfs,!ext' /o:PathOption=Cmd' },
  , @{name = 'Microsoft.VisualStudioCode'; override = '/SILENT /mergetasks=''!runcode,addcontextmenufiles,addcontextmenufolders''' }
  , @{name = 'Microsoft.PowerShell' }
  , @{name = 'Microsoft.AzureCLI' }
  , @{name = 'Microsoft.AzureStorageExplorer' }
  , @{name = 'Microsoft.DotNet.SDK.5' }
  , @{name = 'Microsoft.DotNet.SDK.6' }
  , @{name = 'Microsoft.DotNet.SDK.7' }
  , @{name = 'Microsoft.SQLServerManagementStudio' }
  , @{name = 'Microsoft.Teams' }
  , @{name = 'Microsoft.WindowsTerminal' }
  , @{name = 'Adobe.Acrobat.Reader.64-bit' }
  # , @{name = 'Oracle.JDK.19' }
  # , @{name = 'AdoptOpenJDK.OpenJDK.8' }
  , @{name = 'Microsoft.OpenJDK.17' }
  , @{name = '7zip.7zip' }
  , @{name = 'Bitwarden.Bitwarden' }
  , @{name = 'Docker.DockerDesktop' }

  , @{name = 'Google.Chrome' }
  , @{name = 'JetBrains.Toolbox' }
  , @{name = 'Mozilla.Firefox.ESR' }
  , @{name = 'Notepad2mod.Notepad2mod' }
  # , @{name = 'Oracle.JavaRuntimeEnvironment'; version = '8.0.3310.9' }

  , @{name = 'Postman.Postman' }
  , @{name = 'Terminals.Terminals' }

  # , @{name = 'CoreyButler.NVMforWindows'; version = '1.1.9' }
  , @{name = 'CoreyButler.NVMforWindows' }

  # , @{name = 'OpenJS.NodeJS.LTS'; version = '12.22.8' }
  # @{name = 'Microsoft.Office" },
  # @{name = "Microsoft.PowerToys" },
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

Foreach ($app in $apps) {
  $global:LASTEXITCODE = 0

  Write-Host "---"
  Write-Host $app.name

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
      } else {
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

      if ($null -ne $app.override) {
        $p += @('--override', $app.override )
      }

      Write-Host "   $cmd $p"
      Write-Host '  --------------'
      & $cmd $p
      Write-Host $LASTEXITCODE
      # if ($LASTEXITCODE -ne 0) { throw 'error' }
    }
  }
}
