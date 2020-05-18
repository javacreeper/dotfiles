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

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for passwordsudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Deprecated
# Install more recent versions of some OS X tools.
# brew install vim --override-system-vi
# brew install homebrew/dupes/grep
# brew install homebrew/dupes/openssh
# brew install homebrew/dupes/screen

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install homebrew/x11/xpdf
# brew install xz

# Install other useful binaries.
brew install wget
brew install git 
brew install git-lfs
brew install git-flow
brew install git-extras
brew install ssh-copy-id
brew install ack
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install tree
brew install ranger
brew install mas
brew install dark-mode
brew install zopfli
# brew install hub
# brew install pkg-config libffi
# brew install exiv2
# brew install magemagick --with-webp
# brew install lua
# brew install lynx
# brew install rhino
# brew install speedtest_cli
# brew install webkit2png
# brew install pandoc

# Lxml (XML processing for Python) and Libxslt
# brew install libxml2
# brew install libxslt
# brew link libxml2 --force
# brew link libxslt --force

# Install Heroku
# brew install heroku/brew/heroku
# heroku update

# Install Docker, which requires virtualbox
# brew install boot2docker

### AppStore Apps

# Install Xcode
mas install 497799835

# Install iStat Menus
mas install 1319778037

# Install Office Apps (OneNote, Pages, Numbers, Keynote)
mas install 409201541
mas install 409203825
mas install 409183694
mas install 784801555

#Install TextWrangler
mas install 404010395

### Casks

# Core casks
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" amethyst
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" disk-drill
brew cask install --appdir="/Applications" xquartz
brew cask install --appdir="/Applications" lulu
brew cask install --appdir="/Applications" mucommader

# Video
brew cask install --appdir="/Applications" vlc

# Development tool casks
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" macdown
# brew cask install --appdir="/Applications" atom
# brew cask install --appdir="/Applications" vagrant
# brew cask install --appdir="/Applications" docker

# Install development fonts
brew cask install font-jetbrains-mono
brew cask install font-jetbrains-mono-powerline

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" opera
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" keepassxc
brew cask install --appdir="/Applications" cheatsheet
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" telegram
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" openvpn-connect
# brew cask install --appdir="/Applications" qbittorrent
# brew cask install --appdir="/Applications" tunnelblick
# brew cask install --appdir="/Applications" slack /
# brew cask install --appdir="/Applications" evernote /
# brew cask install --appdir="/Applications" gimp /
# brew cask install --appdir="/Applications" inkscape /
# brew cask install --appdir="/Applications" virtualbox

# Remove comment to install LaTeX distribution MacTeX
# brew cask install --appdir="/Applications" mactex

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
