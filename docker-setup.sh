#!/bin/bash

#Setting Colours
NC='\033[0m'
RED='\033[31m'
BLUE='\033[34m'
GREEN='\033[32m'
YELLOW='\033[93m' #Techinally bright yellow
GREENBG='\033[102m' #Technically bright green
BLUEBG='\033[44m'
REDBG='\033[41m'
YELLOWBG='\033[103m'
WHITEBG='\033[107m'
WHITE='\033[97m'
BLACK='\033[30m'

#Script

#Docker commands are straight from docker's website
printf "${RED}Installing Docker${NC}\n"

sleep 3

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove $pkg; done

sleep 3

# Add Docker's official GPG key:
apt-get update -y
apt-get install ca-certificates curl gnupg -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

sleep 5

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#Docker Postinstall setps

printf "${RED}Running Docker Post Install Steps${NC}\n"

sleep 3

groupadd docker



usermod -aG docker $USERNAME

sudo mkdir /docker

printf "${RED}Rebooting Now${NC}\n"

reboot now

exit
