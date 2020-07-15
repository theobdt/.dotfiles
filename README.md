# Dotfiles
## Install dependencies

```
$ sudo apt install zsh tmux xclip urlview ranger direnv
```

### vim (8.2)
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

Then `:PluginInstall` in vim.

### Code
```
$ pip3 install black
$ sudo apt install flake8
```

### FZF
```
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```
### ripgrep
```
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
$ sudo dpkg -i ripgrep_11.0.2_amd64.deb
```


## Install config files

```
$ cd
$ git clone https://github.com/theobdt/.dotfiles.git && cd .dotfiles
$ chsh -s $(which zsh)
$ ./install.sh
```
