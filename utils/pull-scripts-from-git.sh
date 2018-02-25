#!/bin/bash    
#title           :pull files from github
#description     :This scripts will pull files from git
#author		     :nsandeep
#date            :Fri Feb  9 06:07:04 EST 2018
#version         :0.1
# usage: pip install <pkg name>

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

#githubURls:-
install_url="https://raw.githubusercontent.com/nsandeeplearning/centos-automation/master/install"
un_install_url="https://raw.githubusercontent.com/nsandeeplearning/centos-automation/master/uninstall"

#softwares to download..
inst_java_8="install-jdk-8-linux-x64.sh"
inst_ora_client="install-oracle-instantclient12.2-tools-12-x64.sh"
inst_py_devel="python-devel-2.7.5-58.el7.x86_64.rpm"
inst_pip_and_wheels="install-pip-and-wheels.sh"

declare -a softlist=($inst_java_8 $inst_ora_client $inst_py_devel $inst_pip_and_wheels)

#getting files from github.
for soft in ${softlist[@]}
do
	echo "getting files for  $soft started....."
    curl -O $install_url/$soft
    echo "getting files for $soft completed....."
done


#changing the file permissions
for soft in ${softlist[@]}
do
	echo "changing the file permissions for  $soft started....."
    chmod 777 -R $soft
    echo "changing the file permissions $soft completed....."
done

#changing the dos2unix
for soft in ${softlist[@]}
do
	echo "changing the document type for  $soft started....."
    dos2unix $soft
    echo "changing the document type $soft completed....."
done




