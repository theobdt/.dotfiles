## PLUGINS
source $XDG_CONFIG_HOME/zsh/zinit/bin/zinit.zsh
# A.
setopt promptsubst
setopt inc_append_history
setopt share_history

# B.
zinit wait lucid for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git


PROMPT=''
# C.
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

#zinit snippet OMZ::plugins/docker/_docker

#zinit snippet OMZ::plugins/docker-compose/_docker-compose


zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::robbyrussell
    #OMZT::alanpeabody
    #OMZT::gnzh



zinit light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept
bindkey '^[h' backward-word
bindkey '^[l' forward-word

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

#navigate previous commands
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

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
#[ -z "$TMUX" ] && tmux -f $TMUX_CONF
[ "$TMUX" ] && alias exit="tmux detach"

# prompt


#python
#VIRTUAL_ENV_DISABLE_PROMPT=1
#source ~/envs/py36/bin/activate

#aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
alias ls="ls --color=auto"
alias la="ls -a"
alias e="vim"
alias v="view"
alias venv="source .venv/bin/activate"
alias r="ranger"
alias py="python3 -m IPython"
alias grep="grep --color=auto"
alias gs="git status"
alias ca="conda activate"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# use fd instead of find (faster), and exclue some directories
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude "**/__pycache__/*"'

# for direnv
#export DIRENV_LOG_FORMAT=""
#eval "$(direnv hook zsh)"

source  ~/.zshenv > /dev/null
