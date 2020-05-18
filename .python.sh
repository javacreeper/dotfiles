#!/usr/bin/env bash

# Install Python and related tools using Homebrew.

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

# Install Python
brew install python
brew install python3

# Remove outdated versions from the cellar.
brew cleanup
