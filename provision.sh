#!/usr/bin/env bash

# update the package db
apt-get update
apt-get install -y python-software-properties
apt-get install -y git subversion 
apt-get install -y memcached build-essential

# install NodeJS https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

# install Grunt
npm -g install grunt-cli

# install java jdk
apt-get install -y openjdk-7-jdk

# install sbt
cd /home/vagrant
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.tgz
tar xzvf sbt.tgz

# add sbt to the PATH env in the .bashrc
echo 'export PATH=/home/vagrant/sbt/bin:$PATH' >> .bashrc

