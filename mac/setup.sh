#!/bin/bash

# xcode and git
XCODE_OUTPUT=$(xcode-select --version)
if echo -e $(xcode-select --version) | grep -Fq "xcode-select version"
then
  echo "Skipping installation of XCode Tools (already installed)"
else
  xcode-select --install
  echo "Hit RETURN when finished with XCode setup (separate window)"
  read
fi


# Homebrew
if [ $(which brew) ];
then
  echo "Skipping installation of Homebrew (already installed)"
else
  echo "Installing Homebrew..."
  ./homebrew_install.rb
fi

brew bundle


# Docker setup
if [ $(which docker) ];
then
  echo "Skipping installation of Docker (already installed)"
else
  open /Applications/Docker.app
  echo "Hit RETURN when finished with Docker setup (separate window)"
  read
fi


# Verify
./test.sh
