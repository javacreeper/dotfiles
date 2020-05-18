#!/usr/bin/env bash

# Install Docker using command-line.

# Download latest docker dmg image
curl -o ~/Downloads/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
# Mount docker image
sudo hdiutil attach ~/Downloads/Docker.dmg
# Install docker image
sudo cp -R /Volumes/Docker/Docker.app/ /Applications/Docker.app
# Unmount docker image
sudo hdiutil detach /Volumes/Docker
