#! /bin/bash
sudo apt-get install -y software-properties-common
# configure repo and install gcc 5 and other C++ tools
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# configure repo for cmake3
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt-get update
# install basic stuff
sudo apt-get install -y mc git
# install gcc, cmake, make and the stuff
sudo apt-get install -y gcc-5 g++-5 cmake3 make valgrind libpthread-stubs0-dev
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 --slave /usr/bin/g++ g++ /usr/bin/g++-5
