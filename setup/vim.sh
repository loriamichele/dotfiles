#!/bin/bash
echo "Installing vim configuration files, please wait ..."

cd ~ && ln -s .dotfiles/vim .vim
cd ~ && ln -s .dotfiles/vim/vimrc .vimrc
chmod 777 .dotfiles/vim/tmp

echo "Installing Bundles ..."
vim +BundleInstall +qall
echo "😄  done"
