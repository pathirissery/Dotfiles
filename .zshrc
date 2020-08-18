alias python=python3
alias pip=pip3

powerline-daemon -q
. /usr/local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/insignificant/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/insignificant/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/insignificant/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/insignificant/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

