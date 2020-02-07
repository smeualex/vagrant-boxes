#!/bin/bash

# chown and chgrp a directory
# param - directory, user, group
setPermissions() {
    if [ -d "$1" ]; then 
        echo "Setting permissions on dir $1 to user=$2; group=$3;"
        sudo chown -R $2 $1
        sudo chgrp -R $3 $1
    fi
}
# set up permissions to our user and group
setPermissions /home/vagrant/src  vagrant vagrant
setPermissions /usr/local         vagrant vagrant