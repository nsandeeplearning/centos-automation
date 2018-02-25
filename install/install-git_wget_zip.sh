#!/bin/bash    
#title           :install-git_wget_zip.sh
#description     :This script will install git_wget_zip utils
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-git_wget_zip.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

#utils to install..
wget="wget"
zip="zip"
unzip="unzip"
git="git"

declare -a array=($wget $zip $unzip $unzip)

for element in ${array[@]}
do
	echo "Installing $element started....."
    sudo yum install $element -y
    echo "Installing $element completed....."
done
