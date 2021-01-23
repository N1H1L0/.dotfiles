# Run dotbot install script
install:
	./install

# Delete HomeBrew and .dotfiles
delete:
	./os/delete.sh

# Set macos settings
mac:
	./os/mac.sh

# Save snapshot of all Homebrew packages to brew/Brewfile
brew-snap:
	brew bundle dump -f --file=brew/Brewfile
	brew bundle --force cleanup --file=brew/Brewfile

# Install the only the most necessary stuff with brew
brew-basic:
	./brew/brew-basic.sh

# Install a more comprehensive set of tools with brew 
brew-all:
	brew update
	brew upgrade 
	brew bundle install --file=brew/Brewfile
	brew cleanup

# Restore Homebrew packages from brew-basic
brew-restore-basic:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
	./brew/brew-basic

# Restore Homebrew packages from brewfile 
brew-restore-all:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
	brew update
	brew upgrade
	brew bundle install --file=brew/Brewfile
	brew cleanup

# Switch default shell to bash
bash:
	chsh -s /bin/bash

# Switch default shell to zsh
zsh: 
	chsh -s /bin/zsh

# Switch default shell to brew installed bash 
brew-bash:
	chsh -s /usr/local/bin/bash

# Switch default shell to brew installed zsh
brew-zsh:
	chsh -s /usr/local/bin/zsh 

.PHONY: install delete mac brew-snap brew-basic brew-all brew-restore-basic bash zsh brew-bash brew-zsh 
