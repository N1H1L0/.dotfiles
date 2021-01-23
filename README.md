<pre>
                                   __      __  _____ __
                              ____/ /___  / /_/ __(_) /__  _____
                             / __  / __ \/ __/ /_/ / / _ \/ ___/
                         _  / /_/ / /_/ / /_/ __/ / /  __(__  )
                        (_) \__,_/\____/\__/_/ /_/_/\___/____/

</pre>

## Usage
**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Installation
###### With https
```sh
git clone https://github.com/N1H1L0/.dotfiles.git .dotfiles --recursive; cd .dotfiles; make install; cd -
```
###### With ssh
```sh
git clone git@github.com:N1H1L0/.dotfiles.git .dotfiles --recursive; cd .dotfiles; make install; cd -
```
###### With GitHub CLI 
```sh
gh repo clone N1H1L0/.dotfiles .dotfiles --recursive; cd .dotfiles; make install; cd -
```

.dotfiles uses [Dotbot][dotbot] for installation.

### Updating once installed

Run `dfu` for DotFiles Update and your dotfiles will automatically update.

### Other Tasks

*[See Makefile](./Makefile)*

## Making Local Customizations

You can make local customizations for some programs by:

1. Run `cd; mkdir .dot_local; cd .dot_local`
2. Make and edit any of these files 
  * `vim` : `vimrc_local`
  * `bash`: `bashrc_local_before` run before `.bashrc`
  * `bash`: `bashrc_local_after` run after `.bashrc`
  * `zsh` : `zshrc_local_before` run before `.zshrc`
  * `zsh` : `zshrc_local_after` run after `.zshrc`
  * `zsh` / `bash` : `shell_local_before` run first
  * `zsh` / `bash` : `shell_local_after` run last
  * `git` : `gitconfig_local`
  * `tmux` : `tmux_local.conf`
  * `GNU Readline` : `inputrc_local`

## License

All of my code in this project is MIT Licensed - see the LICENSE.md file for details. Any submodules follow their own licensing.

[dotbot]: https://github.com/anishathalye/dotbot
