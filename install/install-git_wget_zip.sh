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
vim="vim"
declare -a toolslist=($wget $zip $unzip $unzip $vim)

for tool in ${toolslist[@]}
do
	echo "Installing $tool started....."
    sudo yum install $tool -y
    echo "Installing $tool completed....."
done

