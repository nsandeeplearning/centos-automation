#!/bin/bash    
#title           :install-ms-sqlclient.sh
#description     :This script will install msodbcsql
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-ms-sqlclient.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

msodbcsql="msodbcsql-13.1.9.2-1.x86_64.rpm"

echo "Downloading $msodbcsql started..."
wget https://packages.microsoft.com/rhel/7/prod/$msodbcsql
echo "Downloading $msodbcsql completed..."

echo "Assiginging permissions to $msodbcsql started..."
chmod 777 $msodbcsql
echo "Assiginging permissions to $msodbcsql completed..."

echo "Installation of $msodbcsql started..."
ACCEPT_EULA=Y yum localinstall $msodbcsql -y
echo "Installation of $msodbcsql completed..."