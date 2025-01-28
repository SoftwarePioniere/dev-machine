$path = Join-Path -Path $(Get-Location) -ChildPath 'install-winget-packages.ps1'
Write-Host $path

Start-Process powershell.exe -verb runAs -ArgumentList '-NoExit', '-File', $path