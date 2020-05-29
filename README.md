# Dotfiles
## Install dependencies

```
$ sudo apt install zsh tmux xclip urlview ranger bat
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

## Install config files

```
$ cd
$ git clone https://github.com/theobdt/.dotfiles.git && cd .dotfiles
$ chsh -s $(which zsh)
$ ./install.sh
```
