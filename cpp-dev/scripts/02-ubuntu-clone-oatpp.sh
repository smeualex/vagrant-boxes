#!/bin/bash

# associative array with all the repos to clone
#   key - repo url
#   val - dest directory to clone in
declare -A reposToClone
reposToClone=(
    [https://github.com/oatpp/oatpp.git]=/home/vagrant/src/oatpp-project/oatpp 
    [https://github.com/oatpp/oatpp-swagger.git]=/home/vagrant/src/oatpp-project/oatpp-swagger 
    [https://github.com/oatpp/example-microservices]=/home/vagrant/src/oatpp-project/examples/microservices)

gitClone() {
    gitPath=$1
    destination=$2

    git clone $gitPath $destination
}

rmDirIfExists() {
    if [ -d "$1" ]; 
        echo "Removing directory $1"
        then rm -Rf $1
    fi
}

for repoUrl in "${!reposToClone[@]}"; do 
    destDir=${reposToClone[$repoUrl]}
    echo "--------------------------------------------"
    echo "Cloning $repoUrl into $destDir"
    # remove any existing directory
    rmDirIfExists $destDir
    # git clone
    gitClone $repoUrl $destDir
    echo "--------------------------------------------"
done