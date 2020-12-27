: <<'END'
# Add brew completions in zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
END

# Oh My Zsh settings

export ZSH="$HOME/.dotfiles/zsh/plugins/ohmyzsh"

ZSH_THEME="cypher"

# If plugins are taking to long to load you could switch to using Zgen load some on startup and then load the rest with a function if you don't need every plugin at startup
plugins=(git colorize vi-mode pip brew osx asdf)

source $ZSH/oh-my-zsh.sh
