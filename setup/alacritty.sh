#!/bin/bash
echo "Installing alacritty configuration file, please wait ...\n"

cd ~ && mkdir -p .config/alacritty
cd ~ && ln -s .dotfiles/alacritty/alacritty.yml .config/alacritty/alacritty.yml

echo "Cloning and compiling Alacritty..."

cd ~ && mkdir git_projects
git clone https://github.com/jwilm/alacritty.git ~/git_projects
curl https://sh.rustup.rs -sSf | sh
cd ~/alacritty
rustup override set stable
rustup update stable
cargo build --release

echo "Alacritty successfully built:\n  ~/git_projects/alacritty/target/release/alacritty"

echo "😄  done"
