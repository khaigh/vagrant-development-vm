#! /bin/sh

echo "[Diffing config.fish]"
diff ~/.config/fish/config.fish /vagrant/.vm_files/config.fish
echo "[Diffing tmux.conf]"
diff ~/.tmux.conf /vagrant/.vm_files/tmux.conf
echo "[Diffing .vimrc]"
diff ~/.vimrc /vagrant/.vm_files/vimrc
echo "[Diffing .vim files]"
diff -r ~/.vim/ /vagrant/.vm_files/vim/
