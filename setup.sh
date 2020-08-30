#!/bin/bash

set -euxo pipefail

sudo apt-get -y update && sudo apt-get -y upgrade

sudo apt-get install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 2376/tcp #node driver Docker daemon TLS port
sudo ufw disable
sudo ufw enable

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

exit 0
