#!/usr/bin/env bash
set -e
# Sometimes Windows just destroys end of lines
sudo apt-get install -y dos2unix

echo "Executing install scripts"
SCRIPTS=$(find /vagrant/cpp-dev/scripts -name "*-ubuntu-*.sh" -type f)
for SCRIPT in ${SCRIPTS}; do
  echo
  echo
  echo
  echo "--------------------------------------------"
  SCRIPT_NAME=$(basename ${SCRIPT})
  echo "Running ... ${SCRIPT_NAME}"
  
  echo "converting line endings"
  dos2unix ${SCRIPT_NAME}
  sudo "${SCRIPT}"
  
  echo "Finished ... ${SCRIPT_NAME}"
  echo "--------------------------------------------"
done

# note: this is the one-liner ==> i preffered logging start/stop on each script
# find and execute the install scripts
# do a chmod +x just for safety
#find /vagrant/cpp-dev/scripts -name "*-ubuntu-*.sh" -exec chmod +x {} \; -exec {} \;

echo "done"

