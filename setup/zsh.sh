#!/bin/bash
echo "Installing zsh configuration files, please wait ...\n"
echo "*** NOTE: after installing oh-my-zsh, a new shell will be opened, pausing"
echo "the script execution. Exit from that shell, with <C-D> to continue installing"

cd ~ && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

rm ~/.zshrc
cd ~ && ln -s .dotfiles/zsh/zshrc .zshrc
cd ~ && ln -s .dotfiles/zsh/bash_aliases .bash_aliases
cd ~ && ln -s .dotfiles/zsh/tmux.conf .tmux.conf

echo "Done installing zsh/tmux config files! 👌 "
