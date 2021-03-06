#! /bin/bash

# get build tools
sudo apt-get update
sudo apt-get install --no-install-recommends -y build-essential

# grab latest node.js and build it
mkdir ~/node-latest-install
cd ~/node-latest-install
curl -s http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
./configure --prefix=~/local
make install

# get the node package manager
curl -L https://npmjs.org/install.sh | sh

# install gulp
npm install -g gulp

# install gem for sass and compass
sudo apt-get install --no-install-recommends -y ruby1.9.1-dev rubygems

sudo gem install bundler
