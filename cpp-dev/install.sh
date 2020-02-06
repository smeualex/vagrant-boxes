#!/bin/sh 

gitClone() {
    gitPath=$1
    destination=$2

    git clone $gitPath $destination
}

cmakeInstall(){
    projectPath=$1
    cd $projectPath
    mkdir ./build
    cd ./build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make install
}

# configure repo for cmake3
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt-get update

# install basic stuff
sudo apt-get install -y mc git

# configure repo and install gcc 5 and other C++ tools
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y gcc-5 g++-5 cmake3 make valgrind libpthread-stubs0-dev

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5

# get stuff from Git

# Oat++
gitClone https://github.com/oatpp/oatpp.git             /home/vagrant/src/oatpp-project/oatpp
gitClone https://github.com/oatpp/oatpp-swagger.git     /home/vagrant/src/oatpp-project/oatpp-swagger
gitClone https://github.com/oatpp/example-microservices /home/vagrant/src/oatpp-project/examples/microservices
# tmux plugin manager
gitClone https://github.com/tmux-plugins/tpm /home/vagrant/.tmux/plugins/tpm

# set up permissions
sudo chown -R vagrant /home/vagrant/src
sudo chgrp -R vagrant /home/vagrant/src
sudo chown -R vagrant /usr/local
sudo chgrp -R vagrant /usr/local

# build and install oat++
cmakeInstall /home/vagrant/src/oatpp-project/oatpp
cmakeInstall /home/vagrant/src/oatpp-project/oatpp-swagger

# the microservices example is better built from inside the machine -> vagrant ssh 
# 
#/home/vagrant/src/oatpp-project/examples/microservices/build_all.sh
# start micro-services
# /home/vagrant/src/oatpp-project/examples/microservices/run_all_microservices.sh