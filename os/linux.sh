#!/bin/sh

# Installs dependencies for .dotfiles and basic stuff for programming

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

# Resets the style
reset=`tput sgr0`

# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

# Set continue to false by default
CONTINUE=false

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "###############################################" $red
echo ""


echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will install things on your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then

# Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi

if [ $(id -u) != "0" ]; then
  cecho "You must be the superuser to run this script" $red
  exit 
fi



cecho "Here we go.. " $cyan
cecho "  > Install git" $yellow
apt install -y git 


cecho "  > Install build tools (dpkg-dev g++ gcc libc6-dev make)" $yellow
apt install -y build-essential

cecho "  > Install Vim" $cyan
apt install -y vim

cecho "  > Install tmux" $cyan
apt install -y tmux

cecho "  > Install curl" $yellow
apt install -y curl

cecho "  > Install asdf " $yellow
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
asdf update

cecho "  >  Update installed stuff" $yellow
apt update

echo ""
cecho "  ____   ___  _   _ _____  " $cyan
cecho " |  _ \ / _ \| \ | | ____| " $cyan
cecho " | | | | | | |  \| |  _|   " $cyan
cecho " | |_| | |_| | |\  | |___  " $cyan
cecho " |____/ \___/|_| \_|_____| " $cyan

