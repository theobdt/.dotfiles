ARROW="%(?:%{$fg_bold[green]%}➜  :%{$fg_bold[red]%}➜ "

#PROMPT="%{$reset_color%}%{$fg[magenta]%}$(whoami)%{$fg_bold[magenta]%}@$(hostname)"
PROMPT="%{$reset_color%}%{$fg_bold[magenta]%}@$(hostname)"
PROMPT+=' %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'
#PROMPT+=' %{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info)'
#PROMPT+=' %{$fg[gray]%}%~%{$reset_color%} $(git_prompt_info)'
PROMPT+=$'\n''$ARROW'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=")"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
