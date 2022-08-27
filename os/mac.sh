#!/bin/sh

# Sets settings of macOS to the way I like

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
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then

# Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi

cecho "Here we go.. " $cyan
echo ""
cecho "###############################################################################" $green
cecho "# System                                                                      #" $green
cecho "###############################################################################" $green

cecho "  > Set a really fast key repeat" $yellow
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

cecho "  > Allow key repeat in VS code for vim scrolling" $yellow
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

cecho "  > Enable text replacement almost everywhere" $yellow
defaults write -g WebAutomaticTextReplacementEnabled -bool true

cecho "  > Turn off keyboard illumination when computer is not used for 5 minutes" $yellow
defaults write com.apple.BezelServices kDimTime -int 300

cecho "  > Require password immediately after sleep or screen saver begins" $yellow
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

cecho "  > Always show scrollbars" $yellow
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

cecho "  > Avoid creating .DS_Store files on network or USB volumes" $yellow
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

cecho "  > Disable the 'Are you sure you want to open this application?' dialog" $yellow
defaults write com.apple.LaunchServices LSQuarantine -bool false

cecho "  > Show battery percent" $yellow
defaults write com.apple.menuextra.battery ShowPercent -bool true

cecho "  > Check for software updates daily, not just once per week" $yellow
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

cecho "  > Disable double-space period" $yellow
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0

cecho "  > Set up trackpad & mouse speed to what I like" $yellow
defaults write -g com.apple.trackpad.scaling -1
defaults write -g com.apple.mouse.scaling -1

echo ""
cecho "###############################################################################" $green
cecho "# Finder                                                                      #" $green
cecho "###############################################################################" $green

cecho "  > Always open everything in Finder's list view" $yellow
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

cecho "  > Expand save panel by default" $yellow
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

cecho "  > Set sidebar icon size to small" $yellow
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

cecho "  > Show status bar" $yellow
defaults write com.apple.finder ShowStatusBar -bool true

cecho "  > Show path bar" $yellow 
defaults write com.apple.finder ShowPathbar -bool true

cecho "  > Display full POSIX path as Finder window title" $yellow
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

cecho "  > Disable the warning when changing a file extension" $yellow
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
cecho "###############################################################################" $green
cecho "# Photos                                                                      #" $green
cecho "###############################################################################" $green

cecho "  > Disable it from starting every time a device is plugged in" $yellow
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo ""
cecho "###############################################################################" $green
cecho "# Dock                                                                        #" $green
cecho "###############################################################################" $green

cecho "  > Setting the icon size of Dock items to 48 pixels for optimal size/screen-realestate" $yellow
defaults write com.apple.dock tilesize -int 48

cecho "  > Speeding up Mission Control animations and grouping windows by application" $yellow
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

cecho "  > Remove the auto-hiding Dock delay" $yellow
defaults write com.apple.dock autohide-delay -float 0

cecho "  > Remove the animation when hiding/showing the Dock" $yellow
defaults write com.apple.dock autohide-time-modifier -float 0

cecho "  > Automatically hide and show the Dock" $yellow
defaults write com.apple.dock autohide -bool true

cecho "  > Don't animate opening applications from the Dock" $yellow
defaults write com.apple.dock launchanim -bool false

cecho "  > Show App Switcher on all displays" $yellow
defaults write com.apple.dock appswitcher-all-displays -bool true

echo ""
cecho "###############################################################################" $green
cecho "# Chrome, Safari, & WebKit                                                    #" $green
cecho "###############################################################################" $green

cecho "  > Privacy: Don't send search queries to Apple" $yellow
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo ""
cecho "###############################################################################" $green
cecho "# Kill related apps                                                           #" $green
cecho "###############################################################################" $green

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Terminal" "Transmission" "Photos"; do
  killall "$app" > /dev/null 2>&1
done

echo ""
cecho "  ____   ___  _   _ _____  " $cyan
cecho " |  _ \ / _ \| \ | | ____| " $cyan
cecho " | | | | | | |  \| |  _|   " $cyan
cecho " | |_| | |_| | |\  | |___  " $cyan
cecho " |____/ \___/|_| \_|_____| " $cyan

