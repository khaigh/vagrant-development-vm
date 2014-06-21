# vagrant-development-vm

This repo holds all my configuration for my development environment. It supports osx, windows, and linux environments.leveraging vargant.

## requirements

Install [Vagrant](vagrantup.com) and. [VirtualBox](www.virtualbox.org).

## install

```
git clone https://github.com/khaigh/dotfiles.git
up
ssh
```

After the repo is clone, the **up** command will start the virtual machine instance.  
The **ssh** command will shell into the virtual machine.

## what's inside

* a terminal multiplexer - tmux
* my favorite text editor - vim
    * 

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## destroy

To remove the virtual machine, install run the **destroy** command.
