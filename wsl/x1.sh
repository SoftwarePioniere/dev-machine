# install software
sudo apt update

sudo apt install curl 

# nvm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 


# import existing ssh keys

mkdir ~/.ssh
cd ~/.ssh

cat << EOF >>  ~/.ssh/id_rsa
The current working directory is: $PWD
You are logged in as $(whoami)
EOF

cat << EOF >>  ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDElYCmARh2IKaDNTGvrVKOK69Vw0PD6/P86QeBiGzkYRk5EdOw4IacGFU4VrCzDtF98gZG2Yan6fY7GKjOLtEgJeg5g9PlGNDBxuJuNyDvJ8P5jsRuEpTB6BTdSGDCj6CzLTMgxROe+lW7sufSpQEW0hC/1AWYVB0OitUcKn3/XYiL0wE1JlpZhEOrt2vLsyowSdPYkmHE002/tUYMjwKypmd20skCuA7HzPmRn5L3QN3+VjaPeTumygzAUiN+T9cSIcwGZw2cjJ3sLCC8j3SHHyELtoTSIKfJEwCBhPusXBugUVv7A6JcuV2YV7CBK5gDAP6JaVS/1U1T2MhYJ0jzBJLl1tPmu6D1QWpNh1wcA4mR1ZbyeKdYU5RmfhXyOy1O8xt0o/5hkmM8vGgRQHw9AVvbq9rgp8ssS17geZpkJefRkdjXTu07jIEHMUfYYy67CwJa8WQ+CfS9dH9ENJkhvHlUPSgfeV/3dW3c1u5VPCnCSITQeHFWV9ZjXy3Pcotjj4+RE9J99DsZogB4EzDoEu+8x/CIrv7czDxhQ1uuQMcb38lSC6eKu7Rd4mQ0t2rJnYjF8Givhmg5WP/reHzxokA3tUcz7VqiZYklmAqHHgbLdrVIdokhA/yMDvKrQifL/iCQkV2vuwOQXR/Pz8V9NNb5DXJnnBUCqfIMd0Cd1Q== tb@softwarepioniere.de
EOF

chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa