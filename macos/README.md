# MACOS

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

https://mac.remotedesktopmanager.com
#brew install --cask remote-desktop-manager

brew install --cask jetbrains-toolbox
brew install --cask onedrive
brew install --cask microsoft-teams
brew install --cask postman
brew install --cask bitwarden
brew install --cask adobe-acrobat-reader
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
