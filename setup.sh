#!/bin/sh

# Init
BASE_DIR=`pwd`
cd

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# Change system folder localizations
cd /System/Library/CoreServices/SystemFolderLocalizations/ja.lproj
sudo mv SystemFolderLocalizations.strings SystemFolderLocalizations.strings.back
sudo cp ../en.lproj/SystemFolderLocalizations.strings .

# Kill finder and dock
killall Finder Dock

# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Kick Brewfile
cd $BASE_DIR
brew bundle

# Install oh-my-zsh
cd
curl -L http://install.ohmyz.sh | sh

# Install homesick
sudo gem install homesick
homesick clone git@github.com:osamingo/dotfiles.git
homesick symlink dotfiles

# Cleanup
echo '\n===\n\033[0;32mFinish!!\033[0;39m\n'
