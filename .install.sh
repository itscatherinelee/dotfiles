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

pkg_list=(node nvm tmux vim)
app_list=(atom dropbox iterm2 sublime-text visual-studio-code)

echo "Downloading libraries"
for pkg in "${pkg_list[@]}"
do
	echo "Installing $pkg"
	if brew list $pkg > /dev/null; then
		echo "Package library $pkg is already installed"
	else
		echo "Installing $pkg"
		brew install $pkg
	fi
done

echo "Downloading applications"
for app in "${app_list[@]}"
do
	echo "Installing $app"
	if brew list $app > /dev/null; then
		echo "Application $app is already installed"
	else
		echo "Installing $app"
		brew install --cask $app
	fi
done

# Download powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Download vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
