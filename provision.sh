#!/bin/bash

#####################################################
# Versions
#####################################################
SCALA_VERSION="2.10.4"
SBT_VERSION="0.13.1"
ACTIVATOR_VERSION="1.2.0"
#####################################################


###########################################################################################
# Install NodeJS https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
###########################################################################################
sudo apt-get update
sudo apt-get install -y python-software-properties g++ unzip
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs
###########################################################################################


###########################################################################################
# Install Grunt
###########################################################################################
sudo npm -g install grunt-cli
###########################################################################################


###########################################################################################
# Install Java7 JRE
###########################################################################################
sudo apt-get update
sudo apt-get install openjdk-7-jre-headless -y
###########################################################################################


###########################################################################################
# Install Ruby 1.9.1
###########################################################################################
sudo apt-get install -y ruby1.9.1-full
###########################################################################################


###########################################################################################
# Install Git
###########################################################################################
sudo apt-get -y install git
###########################################################################################


###########################################################################################
# Install Ruby bundler 
###########################################################################################
sudo gem install bundler
###########################################################################################


###########################################################################################
# Install Scala
###########################################################################################
cd /tmp 
sudo apt-get remove scala-library scala
wget www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb
sudo dpkg -i scala-${SCALA_VERSION}.deb
sudo apt-get update
sudo apt-get install scala
rm /tmp/scala-${SCALA_VERSION}.deb
###########################################################################################


######################################################################################################################
# Install SBT
######################################################################################################################
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//${SBT_VERSION}/sbt.deb
sudo dpkg -i sbt.deb
sudo apt-get update
sudo apt-get install sbt
rm /tmp/sbt.deb
######################################################################################################################


######################################################################################################################
# Install dependencies for scala & sbt
#
# Output:
#        ==> default: The following packages have unmet dependencies:
#		 ==> default:  sbt : Depends: java2-runtime
#		 ==> default:  scala : Depends: openjdk-6-jre or
#		 ==> default:                   java6-runtime
#	     ==> default:          Depends: libjansi-java but it is not going to be installed
#		 ==> default: E
#		 ==> default: : 
#		 ==> default: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).
######################################################################################################################
sudo apt-get -y -f install
######################################################################################################################


######################################################################################################################
# Install Typesafe Reactive Platform
# - Activator 1.2.0
# - Akka 2.3.3
# - Play 2.3.0
# - Scala 2.11.1
######################################################################################################################
curl -O http://downloads.typesafe.com/typesafe-activator/${ACTIVATOR_VERSION}/typesafe-activator-${ACTIVATOR_VERSION}
readonly activator_zip="typesafe-activator-${ACTIVATOR_VERSION}.zip"
sudo unzip "$activator_zip" -d /usr/bin
rm /tmp/typesafe-activator-${ACTIVATOR_VERSION}.zip  
sudo chmod a+x /usr/bin/activator-${ACTIVATOR_VERSION}/activator
sudo apt-get update
#######################################################################################################################


########################################################################################################################
# Configure bash profile 
########################################################################################################################
cd /home/vagrant
touch .bash_profile
echo 'export PATH=$PATH:/usr/bin/activator-${ACTIVATOR_VERSION}' >> ~/.bash_profile
sudo apt-get update

