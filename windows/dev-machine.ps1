git config --global user.name "Tobias Boeker"
git config --global user.email tb@softwarepioniere.de

# wsl 
https://docs.microsoft.com/de-de/windows/wsl/install
wsl --install -d ubuntu-20.04
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# ===================================================================================

https://www.hanselman.com/blog/spend-less-time-cding-around-directories-with-the-powershell-z-shortcut
Install-Module z -AllowClobber
code . $PROFILE
Import-Module z

# ===================================================================================
$downloaddir = Join-Path $env:USERPROFILE -ChildPath 'Downloads'

$lcuri = 'https://ftp.lancom.de/LANCOM-Archive/LC-VPN-Client/LC-Advanced-VPN-Client-Win-313-Rel-x86-64.exe'
Invoke-WebRequest -Uri $lcuri -OutFile (Join-Path $downloaddir -ChildPath 'lc-vpn.exe')


$lcuri = 'https://download.teamviewer.com/download/version_13x/TeamViewer_Setup.exe'
Invoke-WebRequest -Uri $lcuri -OutFile (Join-Path $downloaddir -ChildPath 'TeamViewer_13_Setup.exe')

# ===================================================================================

# choco install -y visualstudio2019professional --package-parameters "--locale en-US"
# choco install -y ssms
choco install -y visualstudio2022professional-preview --pre --package-parameters "--locale en-US"

choco install -y office365business --params='/productid:O365ProPlusRetail /exclude:"Teams Lync Publisher" /language:"de-DE"'
# ===================================================================================


# PACKAGES - install-packages.ps1 ===================================================================================

# choco install -y microsoft-edge
# choco install -y firefoxesr
# choco install -y googlechrome

# # choco install -y teamviewer --version=13.2.26558 --ignore-checksums
# choco install -y powershell-core --install-arguments='"ADDEXPLORERCONTEXTMENUOPENPOWERSHELL=1"'
# choco install -y microsoft-windows-terminal

# choco install -y git --params "/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration"
# choco install -y git-credential-manager-for-windows

# choco install -y 7zip.install
# choco install -y notepad2
# choco install -y adobereader
# choco install -y terminals
# choco install -y bitwarden

# choco install -y dotnetcore-sdk
# choco install -y dotnet-sdk
# choco install -y jre8



# # choco install -y curl
# # choco install -y putty.install
# choco install -y postman
# choco install -y azure-cli 
# choco install -y docker-for-windows 
# choco install -y jetbrainstoolbox
# choco install -y vscode
# choco install -y nodejs-lts --version=12.22.1
# choco install -y visualstudio2019professional

# choco install -y robo3t.install
# choco install -y redis-desktop-manager

# choco install -y whatsapp --ignore-checksums
# choco install -y signal
# choco install -y microsoft-teams

# choco install -y adobe-creative-cloud --ignore-checksums



# choco install paint.net
# choco install -y eartrumpet

# choco install -y nuget.commandline

# choco install -y jre8

# choco install -y visualstudio2019enterprise --package-parameters "--locale en-US"
# choco install -y visualstudio2019professional --package-parameters "--locale en-US"



# $packs = @(
#   'microsoft-teams',
#   'firefoxesr',
#   'googlechrome',
#   '7zip.install',
#   'notepad2',
#   'adobereader',
#   'terminals',
#   'curl',
#   'putty.install',
#   'postman',
#   'azure-cli',
#   'bitwarden',
#   'eartrumpet'
#   'snagit',
#   'docker-for-windows',
#   'jetbrainstoolbox',
#   'vscode',
#   'powertoys',
#   'robo3t.install',
#   'redis-desktop-manager',
#   'dotnetcore-sdk',
#   'jre8',
#   'paint.net',
#   'whatsapp',
#   'spotify',
#   'signal',
#   'rdmfree'
# )




# ===================================================================================



# choco install -y microsoftazurestorageexplorer
# choco install -y sql-server-management-studio

# choco install -y vscode-powershell
# choco install -y vscode-csharp
# choco install -y vscode-docker

# choco install -y NugetPackageExplorer
# choco install -y nuget.commandline
# choco install -y gitversion.portable

# choco install -y dotnetcore-sdk
# choco install -y visualstudio2019professional


# choco install -y dotpeek

# choco install -y resharper
# choco install -y redis-64


# start https://docs.microsoft.com/de-de/sql/azure-data-studio/download?view=sql-server-2017
