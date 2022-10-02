# ===================================================================================

# choco install -y visualstudio2019professional --package-parameters "--locale en-US"
# choco install -y ssms

# choco install -y visualstudio2022professional --package-parameters "--locale en-US"
# choco install -y office365business --params='/productid:O365ProPlusRetail /exclude:"Teams Lync Publisher" /language:"de-DE"'

# ===================================================================================

https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal

$downloaddir = Join-Path $env:USERPROFILE -ChildPath 'Downloads'
$fonturi = 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip?WT.mc_id=-blog-scottha'
Invoke-WebRequest -Uri $fonturi -OutFile (Join-Path $downloaddir -ChildPath 'CascadiaCode.zip')
Expand-Archive -Path (Join-Path $downloaddir -ChildPath 'CascadiaCode.zip') -DestinationPath  (Join-Path $downloaddir -ChildPath 'CascadiaCode-Font') -Force

# import font in windows

# open windows terminal - powershell - settings - font: CaskaydiaCove NF

winget install JanDeDobbeleer.OhMyPosh
# restart shell to reload PATH

pwsh

code . $PROFILE

# insert code block
$file = 'ohmyposhv3-v2.json'
$outf = Join-Path (Join-Path $env:USERPROFILE -ChildPath 'OneDrive') -ChildPath $file
oh-my-posh --init --shell pwsh --config $outf | Invoke-Expression

# ===================================================================================