# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Specify default editor.
export EDITOR='vim'

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    # echo 'Linux'

    # asdf installed with git 
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
    ;;
  'Darwin')
    # echo 'macOS'

    # asdf installed with brew
    . /usr/local/opt/asdf/asdf.sh
    . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
    ;;
  *)
    # echo 'other os'
    ;;
esac

