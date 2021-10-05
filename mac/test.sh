#!/bin/bash

RESULT=0

red() {
  printf '\033[;31m'
  echo -e $1
  printf '\033[0m'
}

green() {
  printf '\033[;32m'
  echo -e $1
  printf '\033[0m'
}

verify_install() {
  COMMAND=$1
  CHECK=$2
  NAME=$3

  COMMAND_OUTPUT=$($COMMAND 2>&1)

  echo -e "Checking install for $NAME..."
  if echo -e "$COMMAND_OUTPUT" | grep -Fq "$CHECK"
  then
    green $(echo -e "$COMMAND_OUTPUT" | grep -F "$CHECK" | head -1)
  else
    RESULT=$?
    red "$NAME may not have been installed correctly"
  fi

  echo
}

echo
echo "**************************"
echo "Verifying installations..."
echo "**************************"
echo

# Installer
verify_install "brew --version" "Homebrew" "Homebrew"

# Coding Necessities
verify_install "git --version" "git version" "Git"
verify_install "java -version" "openjdk" "Java"
verify_install "node --version" "v" "Node"
verify_install "npm --version" "." "NPM"

# Useful Utilities
verify_install "ffmpeg -version" "ffmpeg version" "ffmpeg"
verify_install "convert --version" "ImageMagick" "ImageMagick"
verify_install "rsvg-convert --version" "rsvg-convert" "librsvg"

# Docker is not supported by M1 (yet)
# verify_install "docker --version" "Docker version" "Docker"

# Applications
verify_install "code --version" "1" "VS Code"
verify_install "ls -1 /Applications" "IntelliJ" "IntelliJ"
verify_install "ls -1 /Applications" "Android Studio" "Android Studio"
verify_install "ls -1 /Applications" "Chrome" "Chrome"
verify_install "ls -1 /Applications" "Firefox" "Firefox"
verify_install "ls -1 /Applications" "Discord" "Discord"
verify_install "ls -1 /Applications" "Streamlabs" "Streamlabs"

exit $RESULT

