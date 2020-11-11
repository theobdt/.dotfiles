# Dotfiles
## Install dependencies

```
$ sudo apt install zsh tmux xclip urlview ranger direnv
```

### vim (8.2)
Install binaries:
```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
Or compile from source, following the instructions [here](https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source):
1. `$ git clone https://github.com/vim/vim.git && cd vim`
3. To configure vim, first activate the desired virtual environment, then:
```
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-python3-config-dir=$(python3-config --configdir) \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=$HOME/.local
```
4. `make`
5. `make install`


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
$ chsh -s $(which zsh)  (optional, since .profile should switch to zsh automatically)
$ ./install.sh
```
Then `:PluginInstall` in vim.

## Zsh prompt
After install zsh plugins (by running `$ zsh` the first time), replace the content of the default theme with:
```
$ ln -si $PWD/prompt.zsh $XDG_CONFIG_HOME/zsh/.zinit/snippets/OMZT::robbyrussell/OMZT::robbyrussell
```
TODO: find a better way to make it work with zinit (zsh plugin manager)


## Potential problems

* If you delete `$HOME/.local/share/vim`, vim will not be able to write swap.
Run `mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}` to recreate the necessary folders.
* If vim outputs `No protocol specified`, it means it cannot connect to the X server (and to the clipboard). To solve this, check that:
    * X11 forwarding is enabled on ssh
    * `xauth` and `xclip` must be installed on the server
    * vim has been compiled with `+xterm_clipboard`, and `+X11`, (with `$ vim --version`)
    * test without tmux `echo $DISPLAY`, should output `localhost:10.0`
    * restart tmux server if necessary
