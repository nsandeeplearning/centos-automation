#!/bin/bash    
#title           :install-pip-and-wheels.sh
#description     :This script will install pip-and-wheels
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-pip-and-wheels.sh


if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

pip_and_wheels="get-pip.py"

echo "Downloading $pip_and_wheels started......."
sudo wget -O $pip_and_wheels  "https://bootstrap.pypa.io/$pip_and_wheels"
echo "Downloading $pip_and_wheels completed......."

echo "Assiginging permissions to $pip_and_wheels started....."
sudo chmod 777 $pip_and_wheels
echo "Assiginging permissions to $pip_and_wheels completed....."

echo "Installation of $pip_and_wheels started....."
sudo python $pip_and_wheels
echo "Installation of $pip_and_wheels completed....."
echo "$pip_and_wheels installed Successfully....."

echo "Verifying $pip_and_wheels installation...."
sudo pip -V

echo "Removing $pip_and_wheels started......"
sudo rm get-pip.py
echo "Removing $pip_and_wheels completed......"

echo "Installation of python -m pip install --upgrade pip setuptools wheel started....."
sudo python -m pip install --upgrade pip setuptools wheel
echo "Installation of python -m pip install --upgrade pip setuptools wheel completed....."





