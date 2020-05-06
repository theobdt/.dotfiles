## PLUGINS
source $XDG_CONFIG_HOME/zsh/zinit/bin/zinit.zsh
# A.
setopt promptsubst

# B.
zinit wait lucid for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git


PROMPT=''
# C.
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit snippet OMZ::plugins/docker/_docker

#zinit ice svn pick"docker-compose.plugin.zsh"
#zinit ice svn
#zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/_docker-compose

#zinit ice svn
#zinit snippet PZT::modules/docker

zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::robbyrussell

zinit light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept

zinit light zdharma/fast-syntax-highlighting



# Change cursor shape for different vi modes.
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[5 q"
#}

#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# vi mode
bindkey -v
export KEYTIMEOUT=1

autoload -U compinit
zstyle ':completion:*' menu yes select
zmodload zsh/complist

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -v '^w' backward-delete-word

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#tmux
[ -z "$TMUX" ] && tmux new-session
[ "$TMUX" ] && alias exit="tmux detach"

#python
#VIRTUAL_ENV_DISABLE_PROMPT=1
#source ~/envs/py36/bin/activate

#aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
alias ls="ls --color=auto"
alias o="emacs -nw ~/org"
alias la="ls -a"
alias e="vim"
#alias agenda="vim .org +OrgAgendaWeek"

#spark installation
export SPARK_HOME=/usr/local/spark-3.0.0-preview2-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH
export PATH=$SPARK_HOME/bin:$PATH
export PATH="$HOME/.scripts:$PATH"
