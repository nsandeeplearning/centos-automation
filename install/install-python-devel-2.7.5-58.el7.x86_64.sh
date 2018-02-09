#!/bin/bash    
#title           :install-python-devel-2.7.5-58.el7.x86_64
#description     :This script will install pip
#author		     :nsandeep
#date            :Fri Feb  9 06:07:04 EST 2018
#version         :0.1   
#usage		     :bash install-python-devel-2.7.5-58.el7.x86_64

# You must accept the Oracle Binary Code License
# http://www.oracle.com/technetwork/java/javase/terms/license/index.html
# usage: get_jdk.sh <jdk_version> <ext>
# jdk_version: 8(default) or 9
# ext: rpm or tar.gz

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

echo "Downloading python-devel-2.7.5-58.el7.x86_64.rpm started......."
wget -O python-devel-2.7.5-58.el7.x86_64.rpm  "http://mirror.centos.org/centos/7/os/x86_64/Packages/python-devel-2.7.5-58.el7.x86_64.rpm"
echo "Downloading python-devel-2.7.5-58.el7.x86_64.rpmcompleted......."

echo "Assiginging permissions to python-devel-2.7.5-58.el7.x86_64.rpmstarted....."
chmod 777 python-devel-2.7.5-58.el7.x86_64.rpm
echo "Assiginging permissions to python-devel-2.7.5-58.el7.x86_64.rpmcompleted....."

echo "Installation of python-devel-2.7.5-58.el7.x86_64.rpmstarted....."
yum localinstall python-devel-2.7.5-58.el7.x86_64.rpm
echo "Installation of python-devel-2.7.5-58.el7.x86_64.rpmcompleted....."
echo "python-devel-2.7.5-58.el7.x86_64.rpminstalled Successfully....."

echo "Removing python-devel-2.7.5-58.el7.x86_64.rpmstarted......"
rm python-devel-2.7.5-58.el7.x86_64.rpm
echo "Removing python-devel-2.7.5-58.el7.x86_64.rpmcompleted......"
