#!/bin/bash

# cmake and make install
# parameters: project path, build config (Release, Debug, RelMinSize)
cmakeInstall(){
    echo "--------------------------------------------"
    echo "Cmake - $1"
    cd $1
    mkdir ./build
    cd ./build
    cmake -DCMAKE_BUILD_TYPE=$2 ..
    make install
}

# build and install oatpp and oatpp-swagger
cmakeInstall /home/vagrant/src/oatpp-project/oatpp Release
cmakeInstall /home/vagrant/src/oatpp-project/oatpp-swagger Release

# build the microservices example
cd /home/vagrant/src/oatpp-project/examples/microservices
/home/vagrant/src/oatpp-project/examples/microservices/build_all.sh