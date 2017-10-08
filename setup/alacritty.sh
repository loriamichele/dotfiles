#!/bin/bash
echo "Installing alacritty configuration file, please wait ...\n"

cd ~ && mkdir -p .config/alacritty
cd ~ && ln -s .dotfiles/alacritty/alacritty.yml .config/alacritty/alacritty.yml

echo "😄  done"
