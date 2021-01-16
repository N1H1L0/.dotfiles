# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Specify default editor.
export VISUAL=vim
export EDITOR="$VISUAL"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL=vim
  export EDITOR="$VISUAL"
fi

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"


