# Specify default editor.
export VISUAL=vim
export EDITOR="$VISUAL"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL=vim
  export EDITOR="$VISUAL"
fi

