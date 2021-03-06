#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils-apt.sh" \
    && . "./utils.sh"

GIST=2a8d6af7b7505488b14ec023a930590b
print_in_purple "\n   Oh-My-Zsh\n\n"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cd $HOME sudo rm .zshrc && git clone https://gist.github.com/${GIST}.git && mv ${GIST}/.* ./ && sudo rm -r ${GIST}
chsh -s $(which zsh)