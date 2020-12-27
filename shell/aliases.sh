# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    # echo 'Linux'
		alias ls='ls --color=auto'
    ;;
  'Darwin')
    # echo 'macOS'
    alias ls='ls -G'
    ;;
  *)
    # echo 'other os'
    ;;
esac

# Shell dependent Alias (only zsh has global aliases)
case $SHELL in
*/zsh)
   # assume Zsh
   ;;
*/bash)
   # assume Bash
   ;;
*)
   # assume something else
   ;;
esac

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

