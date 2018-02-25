#!/bin/bash    
#title           :install-teradata-client-and-unixodbc.sh
#description     :This script will install teradata-client and unixodbc
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-teradata-client-and-unixodbc.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

teradata_client="tdodbc1620__linux_indep.16.20.00.18-1.tar.gz"
unixodbc="unixODBC.x86_64"
tdodbc1620="tdodbc1620-16.20.00.18-1.noarch.rpm"

echo "Downloading $teradata_client  started..."
sudo curl -O https://raw.githubusercontent.com/nsandeeplearning/centos-automation/master/softwares/$teradata_client
echo "Downloading $teradata_client completed..."

echo "Assiginging permissions to $teradata_client started..."
sudo chmod 777 $teradata_client
echo "Assiginging permissions to $teradata_client completed..."

echo "untar $teradata_client started..."
sudo tar xzf $teradata_client
echo "untar $teradata_client completed..."

#prerequisite
echo "Installation of $unixodbc  started..."
sudo yum install $unixodbc -y
echo "Installation of $unixodbc completed..."

echo "change to tdodbc1620 DIR."
cd tdodbc1620
pwd

echo "Installing $tdodbc1620 started..."
sudo yum localinstall $tdodbc1620 -y
echo "Installing of $tdodbc1620 completed..."

