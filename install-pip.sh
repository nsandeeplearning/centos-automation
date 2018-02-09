#!/bin/bash    
#title           :install-install-pip.sh
#description     :This script will install pip
#author		     :nsandeep
#date            :Fri Feb  9 06:07:04 EST 2018
#version         :0.1   
#usage		     :bash install-pip.sh

# You must accept the Oracle Binary Code License
# http://www.oracle.com/technetwork/java/javase/terms/license/index.html
# usage: get_jdk.sh <jdk_version> <ext>
# jdk_version: 8(default) or 9
# ext: rpm or tar.gz

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

echo "Downloading pip started......."
wget -O get-pip.py  "https://bootstrap.pypa.io/get-pip.py"
echo "Downloading get-pip.py completed......."

echo "Assiginging permissions to get-pip.py started....."
chmod 777 get-pip.py
echo "Assiginging permissions to get-pip.py completed....."

echo "Installation of get-pip.py started....."
python get-pip.py
echo "Installation of get-pip.py completed....."
echo "get-pip.py installed Successfully....."

echo "Verifying get-pip.py installation...."
pip -V

pip --help

echo "Removing get-pip.py started......"
rm get-pip.py
echo "Removing get-pip.py completed......"
