#!/bin/bash    
#title           :install-python-devel-2.7.5-58.el7.x86_64.sh
#description     :This script will install python-devels
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-python-devel

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

python_devel_2="python-devel-2.7.5-58.el7.x86_64.rpm"

echo "Downloading $python_devel_2 started......."
wget -O $python_devel_2  "http://mirror.centos.org/centos/7/os/x86_64/Packages/$python_devel_2"
echo "Downloading $python_devel_2 completed......."

echo "Assiginging permissions to $python_devel_2 started....."
chmod 777 $python_devel_2
echo "Assiginging permissions to $python_devel_2 completed....."

echo "Installation of $python_devel_2 started....."
yum localinstall $python_devel_2
echo "Installation of $python_devel_2 completed....."
echo "$python_devel_2 installed Successfully....."

echo "$python_devel_2 started......"
rm $python_devel_2
echo "Removing $python_devel_2 completed......"
