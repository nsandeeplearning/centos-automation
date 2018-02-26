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
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
echo "Downloading $apache_maven_3 completed......."

echo "Downloading $apache_maven_3 started......."
sudo yum install apache-maven -y
echo "Downloading $apache_maven_3 completed......."

echo 1 | sudo update-alternatives --config java
	
echo 1 | sudo update-alternatives --config javac

	
echo "verifying  $apache_maven_3 started....."
mvn -version
echo "verifying   $apache_maven_3 completed....."




