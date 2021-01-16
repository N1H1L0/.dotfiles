# Main prompt
export PS1="\u@\h\[\e[36m\]:\[\e[m\]\[\e[35m\]\w\[\e[m\]\[\e[36m\]\\$\[\e[m\] "

# Detect the platform (similar to $OSTYPE) for color ls
OS="`uname`"
case $OS in
  'Linux')
    # echo 'Linux'
		alias ls='ls --color=auto'
    eval "$(dircolors ~/.dotfiles/bash/dircolors.bash)"
    export term=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
    export term=screen-256color       # for a tmux -2 session (also for screen)
    export term=rxvt-unicode-256color # for a colorful rxvt unicode session
    ;;
  'Darwin')
    # echo 'macOS'
    if [ -d "/usr/local/Homebrew" -a "brew ls --versions coreutils > /dev/null" ]; then
      # Use coreutils 
      PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
      MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
      alias ls="ls --color=auto"
      eval "$(dircolors ~/.dotfiles/bash/dircolors.bash)"
      export term=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
      export term=screen-256color       # for a tmux -2 session (also for screen)
      export term=rxvt-unicode-256color # for a colorful rxvt unicode session
    else
      # Use FreeBSD (the built in on macOS)
      alias ls="ls -G"
    fi
    ;;
  *)
    # echo 'other os'
    ;;
esac


