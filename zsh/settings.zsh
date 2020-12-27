# Specify default editor.
export EDITOR=vim

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Don't need anything for asdf as zsh plugin does everything for you

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


