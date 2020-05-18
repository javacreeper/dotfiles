#!/usr/bin/env bash

# Install Ruby and related tools using Homebrew.

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

# Install rbenv
brew install rbenv
# Install and use Ruby 2.7.0
rbenv install 2.7.0
rbenv global 2.7.0

# Remove outdated versions from the cellar.
brew cleanup
