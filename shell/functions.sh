# Makes starting a tmux session convenient
st(){
if [ "$TMUX" = "" ]; then
  # check for old session
  if [ "$(tmux ls | grep -v attached | wc -l)" -gt "0" ]; then
      # attach to old session
      tmux a -t "$(tmux ls | grep -v attached | cut -d ":" -f1 | head -n 1)"
  else
      # start new session - dont use exec so it's possible to run without tmux
      tmux
  fi
fi
}

# DotFiles Update
dfu() {
  (
      cd ~/.dotfiles; git pull --ff-only; make install; cd -
  )
}

# Run to get load time for shell
shelltime() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Jump to directory containing file
jump() {
  cd "$(dirname ${1})"
}

# Go up [n] directories
up()
{
  local cdir="$(pwd)"
  if [[ "${1}" == "" ]]; then
      cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
      echo "Error: argument must be a number"
  elif ! [[ "${1}" -gt "0" ]]; then
      echo "Error: argument must be positive"
  else
      for ((i=0; i<${1}; i++)); do
          local ncdir="$(dirname "${cdir}")"
          if [[ "${cdir}" == "${ncdir}" ]]; then
              break
          else
              cdir="${ncdir}"
          fi
      done
  fi
  cd "${cdir}"
}

# Remove and print location of all .DS_Store files in a directory
rmds()
{
  find . -name ".DS_Store" -print -delete
}
