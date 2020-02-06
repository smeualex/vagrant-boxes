#!/bin/sh 

cmakeInstall(){
    projectPath=$1
    cd $projectPath
    mkdir ./build
    cd ./build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make install
}

# build and install oatpp and oatpp-swagger
cmakeInstall /home/vagrant/src/oatpp-project/oatpp
cmakeInstall /home/vagrant/src/oatpp-project/oatpp-swagger

# the microservices example is better built from inside the machine -> vagrant ssh 
# 
#/home/vagrant/src/oatpp-project/examples/microservices/build_all.sh
# start micro-services
# /home/vagrant/src/oatpp-project/examples/microservices/run_all_microservices.sh