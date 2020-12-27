# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Specify default editor.
export EDITOR='vim'

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"

# asdf
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

