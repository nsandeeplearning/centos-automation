#!/bin/bash    
#title           :pull-scripts-from-git.sh
#description     :This script will pull scripts from github 
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh pull-scripts-from-git.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

#githubURls:-
install_url="https://raw.githubusercontent.com/nsandeeplearning/centos-automation/master/install"

#softwares to download..
inst_java_8="install-jdk-8-linux-x64.sh"
inst_ora_client="install-oracle-instantclient12.2-tools-12-x64.sh"
inst_py_devel="python-devel-2.7.5-58.el7.x86_64.rpm"
inst_pip_and_wheels="install-pip-and-wheels.sh"
inst_git_wget_zip="install-git_wget_zip.sh"
inst_maven="install-maven.sh"
inst_ms_sqlclient="install-ms-sqlclient.sh"
inst_pentaho="install-pentaho.sh"
pip_and_wheels="install-pip-and-wheels.sh"
pip_packages="install-pip-packages.sh"
install_python3="install-python3.sh"
teradata_client_and_unixodbc="install-teradata-client-and-unixodbc.sh"

declare -a softlist=($inst_java_8 $inst_ora_client $inst_py_devel $inst_pip_and_wheels $inst_git_wget_zip
$inst_maven $inst_ms_sqlclient $inst_pentaho $pip_and_wheels $pip_packages $install_python3 $teradata_client_and_unixodbc)

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





