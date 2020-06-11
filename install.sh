#!/usr/bin/zsh

# Before running this: make sure you have installed zsh, git, gcc, cmake, curl
####################### ZSH ########################
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

####################### VIM ########################
# Install vim plug (Plugin Manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# To install plugins using vim-plug, type:
# :PlugInstall

# Better syntax highlighting in C++: vim-cpp-enhanced-highlight
mkdir -p ~/.vim/after/syntax/
wget https://raw.githubusercontent.com/octol/vim-cpp-enhanced-highlight/master/after/syntax/c.vim -O ~/.vim/after/syntax/c.vim
wget https://raw.githubusercontent.com/octol/vim-cpp-enhanced-highlight/master/after/syntax/cpp.vim -O ~/.vim/after/syntax/cpp.vim

###################### SYMLINKS #####################
ln -s "$(pwd)/.vimrc" ~/.vimrc
ln -s "$(pwd)/.zshrc" ~/.zshrc
