# MACOS

## 1. BREW-CLI installieren

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## 2. Software installieren
### Bitte jeden Befehl einzeln ausführen, da es bei einigen Packeten CLI-befehle gibt damit diese auch über die CLI aufgerufen werden können
```
brew install --cask powershell
brew install --cask google-chrome
brew install --cask microsoft-edge
brew install --cask jetbrains-toolbox
brew install --cask azure-data-studio
brew install --cask onedrive
brew install --cask bitwarden
brew install --cask microsoft-azure-storage-explorer
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask whatsapp
brew install --cask microsoft-teams
brew install --cask postman
brew install azure-cli
brew install nvm
brew install git
brew install openjdk
brew install cocoapods
brew install ruby

# falls es beim installieren vom Paket "Ruby" gibt, folgenden befehl ausführen
brew reinstall ruby

# DOTNET-SDKs installieren -> Hier alles auswählen und im Terminal einfügen

brew tap isen-ng/dotnet-sdk-versions
brew install --cask dotnet-sdk6-0-400
brew install --cask dotnet-sdk7-0-400
brew install --cask dotnet-sdk8-0-200
brew install --cask dotnet-sdk8-0-300

## Anschließend mal schauen, ob alle dotnet-sdks korrekt installiert sind
dotnet --list-sdks

# XCode installieren -> Hier im Safari-Browser einfügen. Der Appstore sollte sich dann öffnen.
https://apps.apple.com/de/app/xcode/id497799835?

# cocoapods installieren (Packagemanager für MacOS)
sudo gem install cocoapods

# Falls es dabei zu fehler kommt ->
gem update --system 3.5.11

sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

```
### Shell-Profil anpassen
Shell-Profil anpassen | entweder "~/.zprofile" oder "~/.bash-profile" editieren und folgende Zeile einfügen

export JAVA_HOME=$(/usr/libexec/java_home) 

### [Docker installieren](https://www.docker.com)

### install latest release of node

```
nvm install node
```

### or install latest lts version

```
nvm install 'lts/*'
```

### or a specific version

```
nvm install 16.14.2
```

### Apps via Jetbrains-ToolBox installieren

1. Command + space
2. "jetbrains" eingeben
3. Enter drücken -> Oben rechts sollte ein kleines fenster erscheinen
4. Folgende Programme installieren -> Webstorm | Rider | Android Studio


## 3 Optionale

```
# Brew in Powershell ausführbar machen
# Terminal öffnen und "pwsh" eingebeb -> "ENTER"
# folgende Zeile einfügen und mit Enter ausführen
New-Item -Path (Split-Path -Parent -Path $PROFILE.CurrentUserAllHosts) -ItemType Directory -Force Add-Content -Path $PROFILE.CurrentUserAllHosts -Value '$($HOMEBREW_PREFIX/bin/brew shellenv) | Invoke-Expression'


brew install --cask discord
brew install --cask godot
brew install -—cask Spotify
```



# Ältere Version

## LINKS

- https://brew.sh
- https://developer.apple.com/download/

## SOFTWARE

```

brew update 

brew outdated

# brew install git
brew install azure-cli
brew install node@12


brew install --cask powershell
brew install --cask dotnet-sdk
brew install --cask visual-studio-code

brew install --cask jetbrains-toolbox
brew install --cask postman

brew install --cask git-credential-manager

brew install --cask bitwarden


sudo gem install cocoapods

brew install --cask microsoft-azure-storage-explorer
brew install --cask azure-data-studio

brew install --cask mongodb-compass

https://docs.docker.com/docker-for-mac/apple-m1/
#brew install --cask docker

brew install --cask google-chrome
brew install --cask microsoft-edge

brew install --cask whatsapp
brew install --cask robo-3t

brew install --cask rectangle
brew install --cask oracle-jdk

# brew install --cask android-platform-tools
# brew install --cask android-studio

```


## XCODE

```

Download Xcode
https://developer.apple.com/download/all/?q=xcode%2014.2

# unzip
xip -x Xcode_14.2.xip
mv Xcode.app /Applications/Xcode_14.2.app

xip -x Xcode_14.3.1.xip
mv Xcode.app /Applications/Xcode_14.3.1.app

# select version
sudo xcode-select -s /Applications/Xcode_14.2.app
sudo xcode-select -s /Applications/Xcode_14.3.1.app

# check version
xcodebuild -version

```

## App Store



## SSH

```
# restart ssh agent
sudo launchctl stop com.openssh.sshd
sudo launchctl start com.openssh.sshd
```

https://technikales.com/quick-steps-to-connect-to-github-through-ssh-in-mac/


## GIT

https://roboleary.net/vscode/2020/09/15/vscode-git.html

git config --global core.editor "code --wait --new-window"
git config --global diff.tool vscode
git config --global difftool.vscode.cmd "code --wait --diff $LOCAL $REMOTE"
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd "code --wait $MERGED"


## NODE/NPM via Node Version Manager

https://github.com/nvm-sh/nvm

### install nvm
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

### install latest release of node

```
nvm install node
```

### or install latest lts version

```
nvm install 'lts/*'
```

### or a specific version

```
nvm install 16.14.2
```
