#!/bin/sh

# TODO: test if GA are already installed
#
# linux headers and basic dev tools for guest-additions
# sudo apt-get install -i linux-headers-$(uname -r) dkms

# # Install GuestAdditions
# # Get the ISO image
# wget http://download.virtualbox.org/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso
# # Create dir and mount the ISO
# sudo mkdir /media/VBoxGuestAdditions
# sudo mount -o loop,ro VBoxGuestAdditions_4.3.8.iso /media/VBoxGuestAdditions
# # Run the installer
# sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
# # Cleanup
# rm VBoxGuestAdditions_4.3.8.iso
# sudo umount /media/VBoxGuestAdditions
# sudo rmdir /media/VBoxGuestAdditions

                # # basic stuff we need
                # sudo apt-get install -y mc tmux python-pip build-essential wget
                # # jupyter
                # pip install pandas jupyter
# Install basics
sudo apt-get install --yes build-essential wget

# Install Anaconda (Python 3)
# https://www.anaconda.com/download/#linux
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O anaconda.sh
bash anaconda.sh -b
export PATH="$HOME/anaconda3/bin:$PATH"
echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> ~/.bash_profile
conda update --yes conda
conda update --yes anaconda

# Create a Conda env
conda create --yes --name cpp_notebook
source activate cpp_notebook

# Install C++ kernel with the notebook server
# https://github.com/QuantStack/xeus-cling#installation
conda install cling xeus-cling notebook xwidgets --yes --channel QuantStack --channel conda-forge

# Start the Jupyter notebook
jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 # --debug