#! /bin/bash
[ -f "$HOME/.config/env" ] && source "$HOME/.config/env"
#echo "ZSh env loaded"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/scratch/vasher/tbodrito/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/scratch/vasher/tbodrito/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/scratch/vasher/tbodrito/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/scratch/vasher/tbodrito/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# CUDA
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
