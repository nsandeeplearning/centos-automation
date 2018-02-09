#!/bin/bash    
#title           :install-install-pip-packages
#description     :This script will install pip packages
#author		     :nsandeep
#date            :Fri Feb  9 06:07:04 EST 2018
#version         :0.1   
#usage		     :bash install-pip-packages

# You must accept the Oracle Binary Code License
# http://www.oracle.com/technetwork/java/javase/terms/license/index.html
# usage: get_jdk.sh <jdk_version> <ext>
# jdk_version: 8(default) or 9
# ext: rpm or tar.gz

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

echo "Installation of Pip install cx_Oracle started....."
Pip install cx_Oracle
echo "Installation of Pip install cx_Oracle completed....."

echo "Installation of Pip install ConfigParser started....."
Pip install ConfigParser
echo "Installation of Pip install ConfigParser completed....."

echo "Installation of pip install --allow-external pyodbc --allow-unverified pyodbc pyodbc started....."
pip install --allow-external pyodbc --allow-unverified pyodbc pyodbc
echo "Installation of pip install --allow-external pyodbc --allow-unverified pyodbc pyodbc completed....."

echo "Installation of pip install pandas started....."
pip install pandas
echo "Installation of pip install pandas completed....."


echo "Installation of pip install pysftp started....."
pip install pysftp
echo "Installation of pip install pysftp completed....."

echo "Verifying get-pip.py installation...."
pip freeze

