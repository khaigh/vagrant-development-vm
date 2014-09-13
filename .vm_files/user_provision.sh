#! /bin/sh

if [ $# -ne 3 ]
  then
    echo "usage: $0 <path to vmfiles> <user> <password>"
    exit 1
fi

export HOME=/home/$2

# update to fish shell and add configuration
echo $3 | chsh -s /usr/bin/fish
mkdir -p $HOME/.config/fish/
cp $1/config.fish $HOME/.config/fish/

# add tmux configuration
cp $1/tmux.conf $HOME/.tmux.conf

# copy vim files
cp -r $1/vim $HOME/.vim
cp $1/vimrc $HOME/.vimrc

# make go directories
mkdir -p $HOME/go/bin
mkdir -p $HOME/go/pkg
mkdir -p $HOME/go/src

# make local/bin directory (for optional pkgs)
mkdir -p $HOME/local/bin

# go get
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$PATH
go get github.com/nsf/gocode
go get code.google.com/p/go.tools/cmd/goimports
go get code.google.com/p/rog-go/exp/cmd/godef
go get code.google.com/p/go.tools/cmd/oracle
go get github.com/golang/lint/golint
go get github.com/kisielk/errcheck
go get github.com/jstemmer/gotags
go get github.com/mattn/gom
