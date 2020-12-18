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
        cd ~/.dotfiles && git pull --ff-only && make install && cd
    )
}

# Run to get load time for shell
shelltime() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
