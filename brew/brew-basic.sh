#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install only the most necessary brew formulae
brew install vim
brew install zsh
brew install git
brew install bash
brew install grep 
brew install asdf
brew install wget 

# Remove outdated versions from the cellar.
brew cleanup
