#!/bin/bash

if ! crontab -l | grep "$HOME/dotfiles/crontab/$(basename -- "$0")"; then
  (crontab -l ; echo "43 00 *   *   3     find /home/$USER/.vim/undo-dir -type f -mtime +90 -delete > /dev/null 2>&1") |sort - | uniq - | crontab - 2>&1
fi
