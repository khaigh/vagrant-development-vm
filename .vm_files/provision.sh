#! /bin/sh

if [ $# -eq 0 ]
  then
    echo "usage: $0 <path to vmfiles>"
    exit 1
fi

apt-get update && apt-get install --no-install-recommends -y \
    curl \
    vim \
    git \
    ctags \
    libc6-dev \
    make \
    man-db \
    fish \
    procps \
    locales \
    tree \
    openssh-client \
    htop \
    tmux \
    mercurial \
    ca-certificates

curl -s https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz | tar -v -C /usr/local -xz

dpkg-reconfigure locales && locale-gen en_US.UTF-8 && /usr/sbin/update-locale LANG=en_US.UTF-8
