#!/bin/bash

if ! crontab -l | grep "$HOME/dotfiles/crontab/$(basename -- "$0")"; then
  (crontab -l ; echo "43 00 *   *   3     find /home/$USER/.vim/undo-dir -type f -mtime +90 -delete") |sort - | uniq - | crontab - 2>&1
  (crontab -l ; echo "0 0 * * * root find / -name “.DS_Store” -depth -exec rm {} \;") |sort - | uniq - | crontab - 2>&1
fi
