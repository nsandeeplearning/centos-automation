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


echo "Downloading pentaho $pentaho started......."
wget -O $pentaho https://comcast.box.com/shared/static/i4i7h6o1xvuziczt6nltfsxob2nho9hl.zip
echo "Downloading pentaho $pentaho completed......."

pwd

echo "Assiginging permissions to pentaho $pentaho started....."
sudo chmod 777 $pentaho
echo "Assiginging permissions to pentaho $pentaho completed....."

pwd

echo "untar  of $pentaho started..."
sudo unzip $pentaho
echo "untar of $pentaho completed..."

mv data-integration /app/oracle_instal

echo "verifying pentaho $pentaho started....."
ls /app/oracle_instal
echo "verifying  pentaho $pentaho completed....."








