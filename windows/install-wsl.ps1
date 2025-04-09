
# requirements
# https://learn.microsoft.com/de-de/windows/wsl/install-manual

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

#reboot

# install
# https://docs.microsoft.com/de-de/windows/wsl/install

# install wsl
wsl --install

# install ubuntu
wsl --install -d Ubuntu-22.04


# list all installed distros
wsl -l -v
wsl --list --online

# UNINSTALL
# https://gist.github.com/4wk-/889b26043f519259ab60386ca13ba91b

dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
