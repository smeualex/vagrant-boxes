#!/bin/sh 

# set up permissions to our user and group
sudo chown -R vagrant /home/vagrant/src
sudo chgrp -R vagrant /home/vagrant/src
sudo chown -R vagrant /usr/local
sudo chgrp -R vagrant /usr/local