Start-Process powershell.exe -verb runAs -ArgumentList '-NoExit', '-Command', "Set-Location $(Get-Location)"
