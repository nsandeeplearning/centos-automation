#!/bin/bash    
#title           :install-oracle-instantclient12.2-tools-12-x64.sh
#description     :This script will install oracle-instantclient12
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-oracle-instantclient12.2-tools-12-x64.sh
	
if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

oracle_instantclient_basic_12="oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm"
oracle_instantclient_tools_12="oracle-instantclient12.2-tools-12.2.0.1.0-1.x86_64.rpm"


echo "Downloading  $oracle_instantclient_basic_12 started..."
wget -O $oracle_instantclient_basic_12 https://comcast.box.com/shared/static/0be8ndipvfogq1on0n6nzmf2utd7vmxi.rpm
echo "Downloading $oracle_instantclient_basic_12 completed..."

echo "Downloading  $oracle_instantclient_tools_12 started..."
wget -O $oracle_instantclient_tools_12 https://comcast.box.com/shared/static/7kj7tsy73vdzot5eacd8fc0x2sy2ytoo.rpm
echo "Downloading $oracle_instantclient_tools_12 completed..."

echo "Assiginging permissions to $oracle_instantclient_basic_12 started..."
chmod 777 $oracle_instantclient_basic_12
echo "Assiginging permissions to $oracle_instantclient_basic_12 completed..."

echo "Assiginging permissions to $oracle_instantclient_tools_12 started..."
chmod 777 $oracle_instantclient_tools_12
echo "Assiginging permissions to $oracle_instantclient_tools_12 completed..."


echo "Installation of $oracle_instantclient_basic_12 started..."
yum localinstall $oracle_instantclient_basic_12 -y
echo "Installation of $oracle_instantclient_basic_12 completed..."

echo "Installation of $oracle_instantclient_tools_12 started..."
yum localinstall $oracle_instantclient_tools_12 -y
echo "Installation of $oracle_instantclient_tools_12 completed..."


