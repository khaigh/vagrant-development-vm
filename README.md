# vagrant-development-vm

This repo holds the configuration for my development environment. It supports osx, windows, and linux environments leveraging vargant.

## requirements

Install [Vagrant](vagrantup.com) and [VirtualBox](www.virtualbox.org).

## install

```
git clone https://github.com/khaigh/vagrant-development-vm.git
./up
./ssh
```

### NOTES for Windows
On windows, ssh uses putty as the ssh client. A putty.reg has been created to launch putty with a solarized color terminal.  
Run regedit on putty.reg to create a session for the local vagrant vm. Before tweaking the registry, make sure you have a full backup of your system. If anything goes wrong, you may end up losing all your data.  Use at your own risk.


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

To remove the virtual machine, install run the **destroy** command. Please note any changes you made to your vm instance will be lost.  Make sure backup / checkin any files beforeing destroying.
