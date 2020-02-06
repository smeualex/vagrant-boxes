#! /bin/bash

gitClone() {
    gitPath=$1
    destination=$2

    git clone $gitPath $destination
}

# clone oatpp, oatpp-swagger and microservices example
gitClone https://github.com/oatpp/oatpp.git             /home/vagrant/src/oatpp-project/oatpp
gitClone https://github.com/oatpp/oatpp-swagger.git     /home/vagrant/src/oatpp-project/oatpp-swagger
gitClone https://github.com/oatpp/example-microservices /home/vagrant/src/oatpp-project/examples/microservices
