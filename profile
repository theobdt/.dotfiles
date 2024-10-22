if [ "$SHELL" != "/bin/zsh"  ] && [ -f "/bin/zsh" ] && [ ! -z "$PS1" ]
then
    export SHELL="/bin/zsh"
    exec /bin/zsh -l    # -l: login shell again
fi

