# Shell dependent Alias (only zsh has global aliases)	
case $SHELL in	
*/zsh)	
   # assume Zsh	
   ;;	
*/bash)	
   # assume Bash	
   if [ -f "$HOME/.asdf/asdf.sh" ]; then 
     # asdf installed with git 
     . $HOME/.asdf/asdf.sh
     . $HOME/.asdf/completions/asdf.bash
   elif [ -d "/usr/local/Homebrew" -a "brew ls --versions asdf >/dev/null" ]; then 
     # asdf installed with brew
     . /usr/local/opt/asdf/libexec/asdf.sh
     . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
   else 
     # do nothing so bash doesn't give errors if asdf isn't installed
     :
   fi
   ;;	
*)	
   # assume something else	
   ;;	
esac

: << 'END'
# Source Homebrew stuff if it is installed
if [ -d "/usr/local/Homebrew" ]; then 
  export PATH="/usr/local/sbin:$PATH"
  if [ "brew ls --versions bzip2 >/dev/null" ]; then
    export PATH="/usr/local/opt/bzip2/bin:$PATH"
  fi
  if [ "brew ls --versions libarchive>/dev/null" ]; then
    export LDFLAGS="-L/usr/local/opt/libarchive/lib"
    export CPPFLAGS="-I/usr/local/opt/libarchive/include"
    export PKG_CONFIG_PATH="/usr/local/opt/libarchive/lib/pkgconfig"
    export PATH="/
  fi
fi
END

