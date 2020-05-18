#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
echo "------------------------------"
echo "Installing Homebrew package manager."
echo "------------------------------"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update && brew upgrade

# Install Zsh
brew install zsh

# Install Oh My Zsh
if [[ ! -d ~/.oh-my-zsh ]]
then
    echo "------------------------------"
    echo "Installing Oh My Zsh."
    echo "------------------------------"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install Powerline10k zsh theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k

# Install ColorLs
gem install colorls
