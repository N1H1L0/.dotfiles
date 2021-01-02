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

if [ -f "$HOME/.asdf/asdf.sh" ]; then 
  # asdf installed with git 
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
elif [ -d "/usr/local/Homebrew" -a "brew ls --versions asdf >/dev/null" ]; then 
  # asdf installed with brew
  . /usr/local/opt/asdf/asdf.sh 
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
else 
  # do nothing so bash doesn't give errors with asdf isn't installed
  :
fi


