#! /bin/sh

if [ $# -eq 0 ]
  then
    echo "usage: $0 <path to vmfiles>"
    exit 1
fi

# update to fish shell and add configuration
echo "vagrant" | chsh -s /usr/bin/fish
mkdir -p /home/vagrant/.config/fish/
cp $1/config.fish /home/vagrant/.config/fish/

# add tmux configuration
cp $1/tmux.conf /home/vagrant/.tmux.conf

# copy vim files
cp -r $1/vim /home/vagrant/.vim
cp $1/vimrc /home/vagrant/.vimrc
