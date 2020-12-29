# Specify default editor.
export EDITOR=vim

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Set fpath so asdf completions work properly
fpath=($HOME/.asdf/completions $fpath)

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    # echo 'Linux'
    ;;
  'Darwin')
    # echo 'macOS'
    ;;
  *)
    # echo 'other os'
    ;;
esac


