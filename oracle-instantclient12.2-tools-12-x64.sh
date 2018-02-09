#!/bin/bash    
#title           :oracle-instantclient12.2-tools-12-x64h
#description     :This script will install oracle-instantclient12
#author		     :nsandeep
#date            :Fri Feb  9 06:07:04 EST 2018
#version         :0.1   
#usage		     :bash oracle-instantclient12.2-tools-12-x64
# You must accept the Oracle Binary Code License
# http://www.oracle.com/technetwork/java/javase/terms/license/index.html
# usage: get_jdk.sh <jdk_version> <ext>
# jdk_version: 8(default) or 9
# ext: rpm or tar.gz

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

echo "Downloading oracle-instantclient12.2-tools-12.2.0.1.0-1.x86_64.rpm started..."
wget -O oracle-instantclient12.2-tools-12-x64.rpm  --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         -N http://ftp.riken.jp/Linux/cern/centos/7/cernonly/x86_64/Packages/oracle-instantclient12.2-tools-12.2.0.1.0-1.x86_64.rpm
echo "Downloading oracle-instantclient12.2-tools-12.2.0.1.0-1.x86_64.rpm completed..."

echo "Assiginging permissions to jdk-8-linux-x64.rpm started..."
chmod 777 oracle-instantclient12.2-tools-12-x64.rpm
echo "Assiginging permissions to jdk-8-linux-x64.rpm completed..."
