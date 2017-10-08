#!/bin/bash

echo "
|---------------------------------------------|
|    ___  ___  _____  ________  __    __  __  |
|   /   \/___\/__   \/ __\_   \/ /   /__\/ _\ |
|  / /\ //  //  / /\/ _\  / /\/ /   /_\  \ \  |
| / /_// \_//  / / / / /\/ /_/ /___//__  _\ \ |
|/___,'\___/   \/  \/  \____/\____/\__/  \__/ |
|---------------------------------------------|

Instalation in progress ...
"

bash setup/alacritty.sh
bash setup/zsh.sh
bash setup/vim.sh
bash setup/font.sh

echo "If no error happens, it means that everything has been installed."
echo ""
echo "Cheers! ✌️ "
