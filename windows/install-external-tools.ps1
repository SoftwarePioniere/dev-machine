$downloaddir = Join-Path $env:USERPROFILE -ChildPath 'Downloads'

# ===================================================================================
# LANCOM VPN CLIENT

$uri = 'https://ftp.lancom.de/LANCOM-Archive/LC-VPN-Client/LC-Advanced-VPN-Client-Win-313-Rel-x86-64.exe'
$file = 'lc-vpn.exe'
$outf = (Join-Path $downloaddir -ChildPath $file)
Invoke-WebRequest -Uri $uri -OutFile $outf
Start-Process $outf

# ===================================================================================
# TEAM VIEWER 13

$uri =  'https://download.teamviewer.com/download/version_13x/TeamViewer_Setup.exe'
$file = 'TeamViewer_13_Setup.exe'
$outf = (Join-Path $downloaddir -ChildPath $file)
Invoke-WebRequest -Uri $uri -OutFile $outf
Start-Process $outf

# ===================================================================================
#  WINDOWS 11 Explorer Patcher
$uri =  'https://github.com/valinet/ExplorerPatcher/releases/latest/download/ep_setup.exe'
$file = 'ep_setup.exe'
$outf = (Join-Path $downloaddir -ChildPath $file)
Invoke-WebRequest -Uri $uri -OutFile $outf
Start-Process $outf