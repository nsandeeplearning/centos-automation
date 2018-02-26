#!/bin/bash    
#title           :install-pip-packages.sh
#description     :This script will install pip packages
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0  
#usage		     :sudo sh install-pip-packages.sh

# 37 pip packages...

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

#pip pkgs to install..

asn1crypto="asn1crypto"
bcrypt="bcrypt"
cffi="cffi"
chardet="chardet"
configobj="configobj"
configparser="configparser"
cryptography="cryptography"
cx_Oracle="cx-Oracle"
decorator="decorator"
enum34="enum34"
idna="idna"
iniparse="iniparse"
ipaddress="ipaddress"
kitchen="kitchen"
numpy="numpy"
pandas="pandas"
paramiko="paramiko"
perf="perf"
pyasn1="pyasn1"
pycparser="pycparser"
pycurl="pycurl"
pygobject="pygobject"
pygpgme="pygpgme"
pyliblzma="pyliblzma"
PyNaCl="PyNaCl"
pyodbc="pyodbc"
pyparsing="pyparsing"
pysftp="pysftp"
python_dateutil="python-dateutil"
pytz="pytz"
pyudev="pyudev"
pyxattr="pyxattr"
six="six"
slip="slip"
slip_dbus="slip.dbus"
teradata="teradata"
urlgrabber="urlgrabber"


echo "Installing 37 pip packages..."

declare -a listpippkgs=($asn1crypto $bcrypt $cffi $chardet $configobj $configparser $cryptography $cx_Oracle $decorator $enum34
$idna $iniparse $ipaddress $kitchen $numpy $pandas $paramiko $perf $pyasn1 $pycparser $pycurl $pygobject
$pygpgme $pyliblzma $PyNaCl $pyodbc $pyparsing $pysftp $python_dateutil $pytz $pyudev $pyxattr $six $slip $slip_dbus $teradata $urlgrabber)

for pippkgname in ${listpippkgs[@]}
do
	echo "Installation of Pip install for  $pippkgname started....."
    sudo pip install $pippkgname
    echo "Installation of Pip install for $pippkgname completed....."
done

echo "Verifying pip packages installation...."
sudo pip freeze

