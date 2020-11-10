#!/bin/bash
echo -e "\n### INSTALLING DOTFILES"

echo -e "\n### INSTALLING DEPENDENCIES"

echo -e "\n### LINKING DOTFILES"
export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"/{vim,zsh,tmux}
ln -si "$PWD/zshenv" "$HOME/.zshenv"
ln -si "$PWD/env" "$XDG_CONFIG_HOME/env"
ln -si "$PWD/vimrc" "$XDG_CONFIG_HOME/vim/vimrc"
ln -si "$PWD/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
ln -si "$PWD/zshrc" "$XDG_CONFIG_HOME/zsh/.zshrc"
ln -si "$PWD/profile" "$HOME/.profile"

# zsh install zinit
echo -e "\n### INSTALLING ZINIT"
ZINIT_HOME="$XDG_CONFIG_HOME/zsh/zinit"
mkdir -p $ZINIT_HOME 
git clone https://github.com/zdharma/zinit.git $ZINIT_HOME/bin
source $ZINIT_HOME/bin/zinit.zsh
echo -e "\n### CHANGING LOGIN SHELL"

source "$XDG_CONFIG_HOME/env"

# vim plugin manager
echo -e "\n### INSTALLING VUNDLE"
mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}
git clone https://github.com/VundleVim/Vundle.vim.git $XDG_CONFIG_HOME/vim/bundle/Vundle.vim

# tmux plugin manager
echo -e "\n### INSTALLING TMUX PLUGINS MANAGER"
git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"


echo -e "\n### INSTALLING VIM PLUGINS"
vim -u NONE +PluginInstall +qall %% echo "OK"

echo -e "\n### INSTALLING TMUX PLUGINS"
#tmux install plugins
tmux start-server 
tmux new-session -d
bash $XDG_CONFIG_HOME/tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
