# vagrant-development-vm

This repo holds the configuration for my development environment. It supports osx, windows, and linux environments leveraging vagrant.

## requirements

Install [Vagrant](vagrantup.com) and [VirtualBox](www.virtualbox.org).

## install

```
git clone https://github.com/khaigh/vagrant-development-vm.git
./up
./ssh
```

After the repo is cloned, the **up** command will start the virtual machine instance.  
The **ssh** command will shell into the virtual machine.

#### NOTES on Windows
_On windows, ssh uses putty as the ssh client. I created putty.reg to register a putty session profile with a solarized color terminal that launches tmux.
Run regedit on putty.reg to create a profile that will connect to the local vagrant virtual machine. This only needs to be done once per machine. Before tweaking the registry, make sure you have a full backup of your system. If anything goes wrong, you may end up losing all your data.  Use at your own risk.

## what's inside

* tmux (a terminal multiplexer)
* fish shell (with my config env)
* vim (my favorite text editor)
    * NERD Tree
    * Ctrl-p
    * Docker suport
    * Multiple Cursors
    * SnipMate
    * SuperTab
    * Syntastic
    * TagBar
    * TagmaTasks
    * Solarized
    * Fugitive
    * Vim-go
    * Vim-javascript
* git
* golang 1.2.2
* docker support

## destroy

To remove the virtual machine, run the **destroy** command. Please note any changes you made to your virtual machine instance will be lost.  Make sure to backup / push any files before destroying.
