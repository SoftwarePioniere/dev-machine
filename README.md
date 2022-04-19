# dev-machine

my dev machine setup

# REQUIREMENTS

```
Start-Process PowerShell -Verb RunAs
powershell -Command "Start-Process PowerShell -Verb RunAs
```

## Windows: Winget

https://chrislayers.com/2021/08/01/scripting-winget/

https://winget.run/

## Windows: Chocolatey

https://chocolatey.org/install

```

choco install -y git --params '/NoShellIntegration /NoGuiHereIntegration /NoShellHereIntegration'

git clone https://github.com/tboeker/dev-machine.git

```

https://chocolatey.org/packages

## MacOS: Homebrew

https://brew.sh/


# SSH

https://docs.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops

## windows 

https://www.damirscorner.com/blog/posts/20200221-UsingGitWithSshInWindows10.html

## WSL

```
cd repos/github/dev-machine/wsl
chmod +x prepare.sh
./prepare.sh


wsl --install -d ubuntu
wsl --set-default ubuntu

```



