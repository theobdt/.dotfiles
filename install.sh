#!/bin/sh
echo "\n### INSTALLING DOTFILES"

echo "\n### INSTALLING DEPENDENCIES"
apt install -y zsh vim tmux urlview xclip

export XDG_CONFIG_HOME="~/.config"
echo "\n### LINKING DOTFILES"
apt install -y zsh vim tmux urlview xclip
mkdir -p "$XDG_CONFIG_HOME"/{vim,zsh,tmux}
ls -s -i zshenv ~/.zshenv
ls -s -i env "$XDG_CONFIG_HOME/env"
ls -s -i vimrc "$XDG_CONFIG_HOME/vim/vimrc"
ls -s -i tmux.conf "$XDG_CONFIG_HOME/tmux/tmux.conf"
ls -s -i zshrc "$XDG_CONFIG_HOME/zsh/.zshrc"

# zsh install zinit
echo "\n### INSTALLING ZINIT"
ZINIT_HOME="$XDG_CONFIG_HOME/zsh/zinit"
mkdir -p $ZINIT_HOME 
git clone https://github.com/zdharma/zinit.git $ZINIT_HOME/bin
source $ZINIT_HOME/bin/zinit.zsh
echo "\n### CHANGING LOGIN SHELL"
sudo chsh -s $(which zsh)

source "$XDG_CONFIG_HOME/env"

# vim plugin manager
echo "\n### INSTALLING VUNDLE"
mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}
git clone https://github.com/VundleVim/Vundle.vim.git $XDG_CONFIG_HOME/vim/bundle/Vundle.vim

# tmux plugin manager
echo "\n### INSTALLING TMUX PLUGINS MANAGER"
git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"


echo "\n### INSTALLING VIM PLUGINS"
vim +PluginInstall +qall

echo "\n### INSTALLING TMUX PLUGINS"
#tmux install plugins
tmux start-server 
tmux new-session -d
./$XDG_CONFIG_HOME/tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server
