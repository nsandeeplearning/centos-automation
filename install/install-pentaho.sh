#!/bin/bash    
#title           :install-pentaho.sh
#description     :This script will install pentaho
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-pentaho.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

pentaho="pdi-ce-6.1.0.1-196.zip"

sudo cd /app
sudo mkdir oracle_instal
	
echo "Downloading pentaho $pentaho started......."
wget -O $pentaho $pentaho https://sourceforge.net/projects/pentaho/files/Data%20Integration/6.1/$pentaho/download
echo "Downloading pentaho $pentaho completed......."

echo "Assiginging permissions to pentaho $pentaho started....."
sudo chmod 777 pentaho $pentaho
echo "Assiginging permissions to pentaho $pentaho completed....."

echo "untar  of $pentaho started..."
sudo tar xzf $pentaho
echo "untar of $pentaho completed..."
ls -lat
pwd
sudo cd /home/KEB_ATHENA
pwd






