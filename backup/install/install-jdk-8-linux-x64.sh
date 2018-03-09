#!/bin/bash    
#title           :install-jdk-8-linux-x64.sh
#description     :This script will install java8
#author		     :sandeep(snamin501)
#date            :Fri Feb  19 10:07:04 EST 2018
#version         :1.0 
#usage		     :sudo sh install-jdk-8-linux-x64.sh

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

jdk_8_linux_64="jdk-8-linux-x64.rpm"

jdk_version=${1:-8}
ext=${2:-rpm}

echo "Checking for Available java-8 versions started....."
readonly url="http://www.oracle.com"
readonly jdk_download_url1="$url/technetwork/java/javase/downloads/index.html"
readonly jdk_download_url2=$(
    curl -s $jdk_download_url1 | \
    egrep -o "\/technetwork\/java/\javase\/downloads\/jdk${jdk_version}-downloads-.+?\.html" | \
    head -1 | \
    cut -d '"' -f 1
)
[[ -z "$jdk_download_url2" ]] && echo "Could not get jdk download url - $jdk_download_url1" >> /dev/stderr

readonly jdk_download_url3="${url}${jdk_download_url2}"
readonly jdk_download_url4=$(
    curl -s $jdk_download_url3 | \
    egrep -o "http\:\/\/download.oracle\.com\/otn-pub\/java\/jdk\/[8-9](u[0-9]+|\+).*\/jdk-${jdk_version}.*(-|_)linux-(x64|x64_bin).$ext" | tail -1
)
echo "Checking for Avaliable java-8 versions completed....."

echo "Downloading jdk-8-linux-x64.rpm started......."
for dl_url in ${jdk_download_url4[@]}; do

    wget -O $jdk_8_linux_64  --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         -N $dl_url
done
echo "Downloading $jdk_8_linux_64 completed......."

echo "Assiginging permissions to $jdk_8_linux_64 started....."
chmod 777 $jdk_8_linux_64
echo "Assiginging permissions to $jdk_8_linux_64 completed....."

echo "Installation of $jdk_8_linux_64 started....."
yum localinstall $jdk_8_linux_64 -y
echo "Installation of $jdk_8_linux_64 completed....."
echo "$jdk_8_linux_64 installed Successfully....."

echo "verifying  $jdk_8_linux_64 started....."
java -version
echo "verifying   $jdk_8_linux_64 completed....."