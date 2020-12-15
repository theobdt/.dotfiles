if [ "$SHELL" != "/bin/zsh"  ] && [ -f "/bin/zsh" ]
then
    export SHELL="/bin/zsh"
    exec /bin/zsh -l    # -l: login shell again
fi

