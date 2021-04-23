#!/bin/bash

# Homebrew
if [ $(which brew) ];
then
  echo "Skipping installation of Homebrew (already installed)"
else
  echo "Installing Homebrew..."
  ./homebrew.sh
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/auroratide/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle

# Git
./git-aliases.sh


# Verify
./test.sh
