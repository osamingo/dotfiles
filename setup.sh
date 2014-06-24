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

# Kick Brewfile
brew bundle ~/dotfiles/Brewfile

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# Init template directory
git config --global init.templatedir '~/.git_template'

