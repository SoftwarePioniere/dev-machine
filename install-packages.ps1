function choc() {
  param(
    [string] $name,
    [string] $installarguments,
    [string] $params,
    [string[]] $installedpackages
  )

  $cmd = 'choco'

  $localinstalled = $false

  foreach ($item in $installedpackages) {
    if ($item.ToLower().Contains($name)) {
      $localinstalled = $true
    }
  }

  $p = @()

  if ($localinstalled) {
    $p += 'upgrade'
  } else 
  {
    $p += 'install'
  }

  $p += $name
  $p += '-y'

  if ($installarguments) {
    $p += '--install-arguments="' + $installarguments + '"'
  }

  if ($params) {
    $p += '--params'
    $p += $params
  }

  $global:LASTEXITCODE = 0

  Write-Host "=============================================================================================="
  Write-Host "$name -- $cmd $p"
  Write-Host "=============================================================================================="
  & $cmd $p

  if ($LASTEXITCODE -ne 0) { throw 'error' }
}

$localpacks = (choco list --localonly)

$packs = @(
  'firefoxesr',
  'googlechrome',
  '7zip.install',
  'notepad2',
  'adobereader',
  'terminals',
  'curl',
  'putty.install',
  'postman',
  'azure-cli',
  'bitwarden',
  'eartrumpet'
  'docker-for-windows',
  'jetbrainstoolbox',
  'vscode',
  'nodejs-lts',
  'robo3t.install',
  'redis-desktop-manager',
  'dotnetcore-sdk',
  'jre8',
  'paint.net',
  'whatsapp'  
)

$packs | foreach { choc -name $_ -installedpackages $localpacks}

choc -name 'powershell-core' -installarguments 'ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1' -installedpackages $localpacks
choc -name 'git' -params '/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration' -installedpackages $localpacks

