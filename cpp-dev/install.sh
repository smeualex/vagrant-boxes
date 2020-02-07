#!/bin/sh 
sudo apt-get install -y dos2unix
echo "converting line endings"
find /vagrant/cpp-dev/scripts -name "*-ubuntu-*.sh" | xargs dos2unix

echo "Executing install scripts"
# find and execute the install scripts
# do a chmod +x just for safety
find /vagrant/cpp-dev/scripts -name "*-ubuntu-*.sh" -exec chmod +x {} \; -exec {} \;
echo "done"
