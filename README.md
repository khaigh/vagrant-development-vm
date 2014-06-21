# vagrant-development-vm

This repo holds the configuration for my development environment. It supports osx, windows, and linux environments leveraging vargant.

## requirements

Install [Vagrant](vagrantup.com) and [VirtualBox](www.virtualbox.org).

## install

```
git clone https://github.com/khaigh/vagrant-development-vm.git
up
ssh
```

After the repo is clone, the **up** command will start the virtual machine instance.  
The **ssh** command will shell into the virtual machine.

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

To remove the virtual machine, install run the **destroy** command.
