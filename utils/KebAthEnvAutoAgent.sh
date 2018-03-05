#!/bin/bash    
#title           :KebAthEnvAutoAgent.sh
#description     :This script will pull scripts from github and run the functions of shells scripts
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh KebAthEnvAutoAgent.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

#scripts dir
keb_current_dir="/home/KEB_ATHENA/"

#boxURls:-
install_url="https://comcast.box.com/shared/static"



#softwares to download..
inst_java_8="install-jdk-8-linux-x64.sh"
inst_ora_client="install-oracle-instantclient12.2-tools-12-x64.sh"
inst_py_devel="python-devel-2.7.5-58.el7.x86_64.sh"
inst_pip_and_wheels="install-pip-and-wheels.sh"
inst_git_wget_zip="install-git_wget_zip.sh"
inst_maven="install-maven.sh"
inst_ms_sqlclient="install-ms-sqlclient.sh"
inst_pentaho="install-pentaho.sh"
inst_pip_packages="install-pip-packages.sh"
inst_python3="install-python3.sh"
inst_teradata_client_and_unixodbc="install-teradata-client-and-unixodbc.sh"

#box softwares to download..
inst_java_8_box="o2um8tdxz3pjpp1ddosmv828yay3sg03.sh"
inst_ora_client_box="jordetld393ve6k28kilkb56cfbvorzn.sh"
inst_py_devel_box="4p8709cs46j19cofle4cyg5ytwh088qf.sh"
inst_pip_and_wheels_box="krzbt3ia8yx5bmsdg6hg2b1e38m9cmbj.sh"
inst_git_wget_zip_box="0g8q9pd78lb3n5cp9ifvtzsm5n98tp57.sh"
inst_mave_box="qajneh1ygrvlhpkewbn3avq9ydv29olx.sh"
inst_ms_sqlclient_box="lgte1ldoirb219zp524zx7iz1x03957i.sh"
inst_pentaho_box="o797uf93o8ui11easm9a5wubdlza4ibl.sh"
inst_pip_packages_box="y10kach5eprg9g4zbqewhdb8oe6331o4.sh"
inst_python3_box="gotkksz2tji4o3sh1nwt7mr4w6ej8xl9.sh"
inst_teradata_client_and_unixodbc_box="p2sx7mh0eq6skzcatksb2663ue9fcvnm.sh"


function KebAthEnvAutoAgent_pull_scripts
{

declare -a softlist=($inst_java_8_box $inst_ora_client_box $inst_py_devel_box $inst_pip_and_wheels_box $inst_git_wget_zip_box
$inst_maven_box $inst_ms_sqlclient_box $inst_pentaho_box $inst_pip_packages_box $inst_python3_box $inst_teradata_client_and_unixodbc_box)

#getting files from github.

for soft_box in ${softlist[@]}
do 
	echo "getting files for  $soft started....."
    wget -O  $soft $install_url/$soft
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

}



#main function starts here..
function KebAthEnvAutoAgent_main
{
	KebAthEnvAutoAgent_pull_scripts
	
	inst_git_wget_zip_func
	
	inst_java_8_func
	
	inst_maven_func
	
	inst_teradata_client_and_unixodbc_func
	
	inst_ms_sqlclient_func
	
	inst_ora_client_func
	
	inst_py_devel_func
	
	inst_pip_and_wheels_func
	
	inst_pip_packages_func
	
	inst_python3_func
	
	inst_pentaho_func
	    
}

#main function ends here..
##############################################################################################
#sub-function starts here..
function inst_git_wget_zip_func
{
    sudo sh $keb_current_dir$inst_git_wget_zip
}

function inst_java_8_func
{
    sudo sh $keb_current_dir$inst_java_8
}


function inst_maven_func
{
    sudo sh $keb_current_dir$inst_maven
}


function inst_teradata_client_and_unixodbc_func
{
	sudo sh $keb_current_dir$inst_teradata_client_and_unixodbc
    
}


function inst_ms_sqlclient_func
{
    sudo sh $keb_current_dir$inst_ms_sqlclient
}

function inst_ora_client_func
{
    sudo sh $keb_current_dir$inst_ora_client
}


function inst_py_devel_func
{
    sudo sh $keb_current_dir$inst_py_devel
}

function inst_pip_and_wheels_func
{
	sudo sh $keb_current_dir$inst_pip_and_wheels
    
}

function inst_pip_packages_func
{
	sudo sh $keb_current_dir$inst_pip_packages
    
}

function inst_pentaho_func
{
    sudo sh $keb_current_dir$inst_pentaho
}


function inst_python3_func
{
    sudo sh $keb_current_dir$inst_python3
}

#sub-function ends here..

echo "main func KebAthEnvAutoAgent_main started....."
KebAthEnvAutoAgent_main
echo "main func KebAthEnvAutoAgent_main completed....."




