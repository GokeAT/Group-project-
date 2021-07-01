#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y wget unzip curl

#Azure CLI, Login, Cluster CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login --identity
az login -u $AZURE_LOGIN_USR -p $AZURE_LOGIN_PSW
sudo az aks install-cli

#Installs Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
mkdir -p ~/.local/bin/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client

#Installs terraform
sudo apt install -y unzip wget
wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin/
rm terraform_*_linux_*.zip

#Installs Docker
curl https://get.docker.com | sudo bash
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo su - ${USER}
sudo newgrp docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version

#Installs Karma
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install v14.16.0
npm install -g @angular/cli