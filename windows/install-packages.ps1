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
    [string] $version,
    [switch] $ignoreChecksums,
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
  }
  else {
    $p += 'install'
    Read-Host -Prompt "Install: $name"
  }

  $p += $name
  $p += '-y'

  if ($installarguments) {
    $p += '--install-arguments="' + $installarguments + '"'
  }
  
  if ($ignoreChecksums) {
    $p += '--ignore-checksums'
  }
  
  if ($version) {
    $p += '--version=' + $version
  }

  if ($params) {
    $p += '--params'
    $p += $params
  }
  
  
  runX -name $name -cmd $cmd -parms $p
 
}

Set-ExecutionPolicy Bypass -Scope Process
 
$localpacks = (choco list --localonly)

$packs0 = @(
  # @{
  #   name = 'git';
  #   params = '/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration';
  # },
  @{
    name = 'powershell-core';
    installarguments = 'ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1';
  }
)

$packs0 | ForEach-Object { choc -name $_.name -installarguments $_.installarguments -params $_.params  -installedpackages $localpacks }

# choc -name 'git' -params '/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration' -installedpackages $localpacks
# choc -name 'powershell-core' -installarguments 'ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1' -installedpackages $localpacks

$packs = @(
  'vscode',
  'microsoft-windows-terminal',
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
  'microsoftazurestorageexplorer',
  'bitwarden',
  # 'eartrumpet'
  'snagit',
  'docker-for-windows',
  'jetbrainstoolbox',
  'powertoys',
  'robo3t.install',
  #   'redis-desktop-manager',
  'dotnetcore-sdk',
  'dotnet-sdk',
  'jre8',
  'paint.net',
  'whatsapp',
  # 'spotify',
  'signal',
  'rdmfree',
  'jdk8',
  'gradle'
)

$packs | ForEach-Object { choc -name $_ -installedpackages $localpacks }

choc -name 'nodejs-lts' -version '12.22.1' -installedpackages $localpacks
choc -name 'adobe-creative-cloud' -ignoreChecksums -installedpackages $localpacks


  
