#!/bin/bash
echo "Installing zsh configuration files, please wait ..."

cd ~ && ln -s .dotfiles/zsh/zshrc .zshrc
cd ~ && ln -s .dotfiles/zsh/oh-my-zsh .oh-my-zsh
cd ~ && ln -s .dotfiles/zsh/oh-my-zsh-custom .oh-my-zsh/custom

chmod 777 .dotfiles/vim/tmp

echo "😄  done"
