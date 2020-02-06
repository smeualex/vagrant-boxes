#!/bin/bash
vagrantBox=jupyter-ubuntu
echo Finding box id ${vagrantBox}
boxId=$(vagrant global-status | grep ${vagrantBox} | awk '{print $1;}')
echo Box Vagrant Id = $boxId
echo $boxId > box.id