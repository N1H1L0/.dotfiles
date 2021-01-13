# Add colors 
alias grep="grep --color"
alias ccat="pygmentize -g"

# Tmux 
alias tka="tmux kill-server"
alias tks="tmux kill-session"

# Deleting
alias rf="rm -rf"

# Prompt if overwriting
alias cp='cp -i'
alias mv='mv -i'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    # echo 'Linux'
    ;;
  'Darwin')
    # echo 'macOS'
    alias uls='ioreg -p IOUSB -l -w 0'
    ;;
  *)
    # echo 'other os'
    ;;
esac


