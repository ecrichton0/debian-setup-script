#!/bin/bash
#Run as root by doing su -
#Created by ecrichton0 on github
#This source code is licensed under the GPL-3.0 license found in the
#LICENSE file in the root directory of this source tree.

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
printf "${RED}Running apt-get update${NC}\n"

sleep 3

apt-get update -y

printf "${RED}Running apt-get upgrade${NC}\n"

sleep 3

apt-get upgrade -y

sleep 3

printf "${RED}Installing VIM${NC}\n"

sleep 3

apt-get install vim -y

printf "${RED}Installing htop${NC}\n"

sleep 3

apt-get install htop -y

printf "${RED}Installing snmpd${NC}\n"

sleep 3

apt-get install snmpd -y

printf "${RED}Copying snmp config files${NC}\n"

rm -f /etc/snmp/snmpd.conf

cp ./snmpd.conf /etc/snmp/snmpd.conf

sleep 3

printf "${RED}Installing sudo${NC}\n"

sleep 3

apt-get install sudo -y

printf "${RED}Please enter your main user account username${NC}\n"

read USERNAME

export USERNAME 

printf "${RED}Adding User Account to sudoers file${NC}\n"

sleep 3

/sbin/adduser $USERNAME sudo

read -p $'\e[32mDo you want to install Docker? (y/N)\e[0m\n' USERINPUT
case $USERINPUT in
    [Yy]* ) ./docker-setup.sh;;
    [Nn]* ) printf "${RED}Rebooting Now${NC}\n"; reboot now;; 
    * ) printf "${BLUE}Please Choose Yes or No${NC}\n";;
esac

exit
