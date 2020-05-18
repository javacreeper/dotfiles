#!/usr/bin/env bash

# Install JDK and related tools using Homebrew.

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

# Install SDKMAN and OpenJDK 11 LTS
if test ! $(which sdk); then
echo "------------------------------"
echo "Installing SDK manager."
echo "------------------------------"
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk version
    sdk install java 11.0.6.hs-adpt
    sdk default java 11.0.6.hs-adpt
    javac -version
fi

# Install Maven
brew install maven

# Install Jetbrains toolbox
brew cask install --appdir="/Applications" jetbrains-toolbox

# Install android sdk
# brew install android-sdk

# Remove outdated versions from the cellar.
brew cleanup
