Write-Host "=============================================================================================="
Write-Output "Configure Powershell"

#  https://www.hanselman.com/blog/spend-less-time-cding-around-directories-with-the-powershell-z-shortcut

Set-ExecutionPolicy Bypass -Scope Process

Install-Module z -AllowClobber
Install-Module -Name Terminal-Icons -Repository PSGallery

$nl = [System.Environment]::NewLine
Add-Content -Path $PROFILE $nl 
Add-Content -Path $PROFILE 'Import-Module z'
Add-Content -Path $PROFILE $nl 
Add-Content -Path $PROFILE 'Import-Module -Name Terminal-Icons'
Add-Content -Path $PROFILE $nl 

code . $PROFILE

# Import-Module z
# Import-Module -Name Terminal-Icons
