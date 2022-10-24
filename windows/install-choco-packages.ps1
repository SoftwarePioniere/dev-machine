Write-Host "=============================================================================================="
Write-Output "Installing Choclatey Apps"

$apps = @(
    @{name = 'robo3t.install'}
  , @{name = 'curl'}
  , @{name = 'paint.net'}
  , @{name = 'redis-desktop-manager'; version = '0.9.3'}
  , @{name = 'paint.net'}
  , @{name = 'adobe-creative-cloud'; ignoreChecksums = $true}  
)


Set-ExecutionPolicy Bypass -Scope Process
 
$localpacks = (choco list --localonly)
$app=$apps[0];

Foreach ($app in $apps) {
  $global:LASTEXITCODE = 0

  $name = $app.name
  Write-Host "---"

  Write-Host $name

  $cmd = 'choco'

  $localinstalled = $false

  foreach ($item in $localpacks) {
    if ($item.ToLower().Contains($name)) {
      $localinstalled = $true
    }
  }

  $p = @()

  if ($localinstalled) {
    $p += 'upgrade'
  }
  else {
    $p += 'install'
    # Read-Host -Prompt "Install: $name"
  }

  $p += $name
  $p += '-y'

  if ($app.installarguments) {
    $p += '--install-arguments="' + $app.installarguments + '"'
  }
  
  if ($app.ignoreChecksums) {
    $p += '--ignore-checksums'
  }

  if ($app.$version) {
    $p += '--version=' + $app.version
  }

  if ($app.$params) {
    $p += '--params'
    $p += $app.params
  }
    
  Write-Host "   $cmd $p"
  Write-Host '  --------------'
  & $cmd $p
  if ($LASTEXITCODE -ne 0) { throw 'error' }

}

  # 'gradle',

<<<<<<< HEAD
# $packs0 = @(
#   # @{
#   #   name = 'git';
#   #   params = '/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration';
#   # },
#   @{
#     name = 'powershell-core';
#     installarguments = 'ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1';
#   }
# )

# $packs0 | ForEach-Object { choc -name $_.name -installarguments $_.installarguments -params $_.params  -installedpackages $localpacks }

# choc -name 'git' -params '/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration' -installedpackages $localpacks
# choc -name 'powershell-core' -installarguments 'ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1' -installedpackages $localpacks

$packs = @(
  'robo3t.install',
  'dotnet-sdk',
  'paint.net'
  # 'gradle',
  # 'curl',
  # 'putty.install'

  # ?? 'jdk8',
#   'vscode',
=======
  # 'putty.install'
    # 'vscode',
>>>>>>> d324f72916d90d71cc09cf57b9250dad28938e97
#   'microsoft-windows-terminal',
#   'microsoft-teams',
#   'firefoxesr',
#   'googlechrome',
#   '7zip.install',
#   'notepad2',
#   'adobereader',
#   'terminals',

# #  'postman',
#   'azure-cli',
#   'microsoftazurestorageexplorer',
#   'bitwarden',
#   'eartrumpet'
#   'snagit',
#   'docker-for-windows',
#   'jetbrainstoolbox',
  # 'dotnetcore-sdk', 
  # 'jre8',
  # 'ssms',
  # 'mongodb-compass',
  # 'powertoys'
  # 'sysinternals'
  # 'whatsapp',
  # 'spotify',
  # 'signal',  
  # 'audacity'