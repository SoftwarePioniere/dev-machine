# wsl 
# https://docs.microsoft.com/de-de/windows/wsl/install

wsl --install -d ubuntu-20.04

# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

$downloaddir = Join-Path $env:USERPROFILE -ChildPath 'Downloads'
$uri = 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi'
$file = 'wsl_update_x64.msi'
$outf = (Join-Path $downloaddir -ChildPath $file)

Invoke-WebRequest -Uri $uri -OutFile $outf

Start-Process $outf