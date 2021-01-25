#!/bin/sh

# This script deletes HomeBrew and .dotfiles

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
echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              THIS SCRIPT DELETES            #" $red
cecho "#            .dotfiles and HomeBrew           #" $red
cecho "#                                             #" $red
cecho "#                 BUT DOES NOT                #" $red
cecho "#             RESET CHANGES MADE BY           #" $red
cecho "#                   make mac                  #" $red
cecho "#                                             #" $red
cecho "###############################################" $red
echo ""

# HomeBrew
if [ -d "/usr/local/Homebrew" ]; then
  echo ""
  cecho "Do you want to delete all HomeBrew formula? (y/n)" $red
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    cecho "  > Deleting all HomeBrew installed formula" $yellow
    brew remove --force $(brew list --formula)
  else
    cecho "Acknowledged a NO-GO. Continuing to the next part of the script." $red
  fi

  echo ""
  cecho "Do you want to delete all HomeBrew Casks? (y/n)" $red
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    cecho "  > Deleting all HomeBrew installed Casks" $yellow
    brew remove --force $(brew list --casks)
  else
    cecho "Acknowledged a NO-GO. Continuing to the next part of the script." $red
  fi

  echo ""
  cecho "Do you want to delete HomeBrew? (y/n)" $red
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    cecho "  > Deleting HomeBrew" $yellow
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
  else
    cecho "Acknowledged a NO-GO. Continuing to the next part of the script." $red
  fi
fi 

# .dotfiles
echo ""
cecho "Do you want to remove all symlinks created by .dotfiles? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  cecho "  > Deleting symlinks for Bash" $yellow
  rm ~/.bashrc
  rm ~/.bash_profile

  cecho "  > Deleting symlinks for Zsh" $yellow
  rm ~/.zshrc
  rm ~/.zprofile
 
  cecho "  > Deleting symlinks for Vim" $yellow
  rm ~/.vimrc

  cecho "  > Deleting symlinks for tmux" $yellow
  rm ~/.tmux.conf

  cecho "  > Deleting symlinks for git" $yellow
  rm ~/.gitconfig

  cecho "  > Deleting symlink for GNU Readline" $yellow
  rm ~/.inputrc
else
  cecho "Acknowledged a NO-GO. Continuing to the next part of the script." $red
fi

echo ""
cecho "Do you want to delete .dotfiles? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  cecho "  > Deleting .dotfiles" $yellow 
  rm -rf ~/.dotfiles
else
  cecho "Acknowledged a NO-GO. Continuing to the next part of the script." $red
fi

echo ""
cecho "  ____   ___  _   _ _____  " $cyan
cecho " |  _ \ / _ \| \ | | ____| " $cyan
cecho " | | | | | | |  \| |  _|   " $cyan
cecho " | |_| | |_| | |\  | |___  " $cyan
cecho " |____/ \___/|_| \_|_____| " $cyan

