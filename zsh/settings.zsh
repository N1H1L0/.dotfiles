# Specify default editor.
export EDITOR=vim

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# asdf
. /usr/local/opt/asdf/asdf.sh

#export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
