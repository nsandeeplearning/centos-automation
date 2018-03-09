#!/bin/bash
dos2unix --version 2>&1 >/dev/null
DOS2UNIX_IS_AVAILABLE=$?
if [ $DOS2UNIX_IS_AVAILABLE -eq 0 ]; then
echo "dos2unix was installed"
else
echo "dos2unix was not installed"
echo "installing dos2unix now.."
sudo yum install dos2unix -y
echo "dos2unix installation completed.."
 fi
