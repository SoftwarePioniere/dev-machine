Write-Host "=============================================================================================="
Write-Output "Installing Choclatey Apps"

$apps = @(
  @{name = 'httpie'}
  , @{name = 'redis-desktop-manager'; version = '0.9.3'}
  # @{name = 'robo3t.install'}
  # , @{name = 'paint.net'}
  , @{name = 'firacode'}
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

  if ($app.version) {
    $p += '--version=' + $app.version
  }

  if ($app.params) {
    $p += '--params'
    $p += $app.params
  }
    
  Write-Host "   $cmd $p"
  Write-Host '  --------------'
  & $cmd $p
  if ($LASTEXITCODE -ne 0) { throw 'error' }

}

  # 'gradle',

  # 'putty.install'
    # 'vscode',
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