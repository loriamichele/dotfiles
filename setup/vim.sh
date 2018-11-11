#!/bin/bash

set -e

echo "Backing up old .vim & .vimrc, if any..."

mv ~/.vim ~/.vim.bak || true
mv ~/.vimrc ~/.vimrc.bak || true

echo "Installing new Vim configuration files, please wait..."

cd ~ && ln -s .dotfiles/vim .vim
cd ~ && ln -s .dotfiles/vim/vimrc .vimrc

mkdir ~/.dotfiles/vim/tmp
chmod 777 ~/.dotfiles/vim/tmp

echo "Installing bundles..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +BundleInstall +qall
echo "Done configuring Vim! 👌 "
