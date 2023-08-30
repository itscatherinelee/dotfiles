#!/bin/sh

TARGET=$HOME/.dotfiles

# Script that helps configure a brand new setup
echo "Configuring brand new setup"
alias config='/usr/bin/git --git-dir=$TARGET --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/itscatherinelee/dotfiles.git $TARGET
alias config='/usr/bin/git --git-dir=$TARGET --work-tree=$HOME'
config config --local status.showUntrackedFiles no

# Create sysmlinks for your modules
ln -s $TARGET/.vim/init.vim $HOME/.vimrc

echo "Downloading brew"
# Download homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Downloading libraries"
brew install node
brew install nvm
brew install tmux
brew install vim

echo "Downloading applications"
brew install --cask atom
brew install --cask dropbox
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask spotify
brew install --cask sublime-text3
brew install --cask virtualbox
brew install --cask visual-studio-code

# Download powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Download vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
