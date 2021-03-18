function runX() {
  param(
    [string] $name,
    [string] $cmd,
    [string[]] $parms
  )

  $global:LASTEXITCODE = 0

  Write-Host "=============================================================================================="
  Write-Host "$name -- $cmd $parms"
  Write-Host "=============================================================================================="
  & $cmd $parms

  if ($LASTEXITCODE -ne 0) { throw 'error' }

}

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

  runX -name $name -cmd $cmd -parms $p
 
}

$localpacks = (choco list --localonly)

$packs = @(
  'microsoft-teams',
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
  'whatsapp',
  'spotify',
  'signal',
  'rdmfree'
)

$packs | foreach { choc -name $_ -installedpackages $localpacks}

choc -name 'powershell-core' -installarguments 'ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1' -installedpackages $localpacks
choc -name 'git' -params '/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration' -installedpackages $localpacks

