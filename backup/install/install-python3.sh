#!/bin/bash    
#title           :install-python3.sh
#description     :This script will install python3
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-python3.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

Python3="Python-3.5.0.tgz"

yum install yum-utils -y

sudo yum-builddep python
	
echo "Downloading $Python3 started......."
curl -O https://www.python.org/ftp/python/3.5.0/$Python3
echo "Downloading $Python3 completed......."

echo "Assiginging permissions to $Python3 started....."
chmod 777 $Python3
echo "Assiginging permissions to $Python3 completed....."

echo "untar  of $Python3 started..."
tar xzf $Python3
echo "untar of $Python3 completed..."


echo "Installation of $Python3 started....."
cd Python-3.5.0
#having multiple copies of python running
./configure
make
make install
echo "$Python3 installed Successfully....."

echo "Installation of pip tarted....."
easy_install pip
echo "Assiginging permissions to pip completed....."	

echo "verifying pentaho $Python3 started....."
python3 --version
echo "verifying  pentaho $Python3 completed....."

