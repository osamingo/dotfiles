#!/bin/sh

# Init
cd ~/

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

# Install homesick
gem install homesick
homesick symlink dotfiles

# Kick Brewfile
brew bundle ~/dotfiles/Brewfile

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh


