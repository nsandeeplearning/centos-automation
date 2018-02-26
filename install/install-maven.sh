#!/bin/bash    
#title           :install-maven.sh
#description     :This script will install maven
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0 
#usage		     :sudo sh install-maven.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

apache_maven_3="apache-maven-3.5.2-bin.tar.gz"

echo "Downloading $apache_maven_3 started......."
cd /usr/local
sudo wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/$apache_maven_3
echo "Downloading $apache_maven_3 completed......."

echo "Assiginging permissions to $apache_maven_3 started....."
sudo chmod 777 $apache_maven_3
echo "Assiginging permissions to $apache_maven_3 completed....."

#compiled version of maven-no installation required..
echo "untar  of $apache_maven_3 started..."
sudo tar xzf $apache_maven_3
echo "untar of $apache_maven_3 completed..."

#linking to maven.
sudo ln -s apache-maven-3.5.2  maven
	
echo "verifying  $apache_maven_3 started....."
mvn -v
echo "verifying   $apache_maven_3 completed....."
