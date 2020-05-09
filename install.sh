#!/usr/bin/zsh

# Install vim plug (Plugin Manager)

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# To install plugins using vim-plug, type:
# :PlugInstall

# Let's set up YouCompleteMe
pushd ~/.vim/plugged/YouCompleteMe
./install.py --clangd-completer
popd

# Better syntax highlighting in C++: vim-cpp-enhanced-highlight
git clone https://github.com/octol/vim-cpp-enhanced-highlight.git /tmp/vim-cpp-enhanced-highlight
mkdir -p ~/.vim/after/syntax/
mv /tmp/vim-cpp-enhanced-highlight/after/syntax/cpp.vim ~/.vim/after/syntax/cpp.vim
rm -rf /tmp/vim-cpp-enhanced-highlight
