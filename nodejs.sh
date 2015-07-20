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
sudo apt-get install --no-install-recommends -y rubygems

sudo gem install sass
sudo gem install compass --pre

npm install -g grunt
npm install -g grunt-cli
npm install -g bower
npm install -g orion-cli
npm install -g ddp-analyzer
npm install -g jscs
npm install -g jshint
npm install -g jsonlint
npm install -g less
