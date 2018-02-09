#!/bin/bash

# You must accept the Oracle Binary Code License
# http://www.oracle.com/technetwork/java/javase/terms/license/index.html
# usage: get_jdk.sh <jdk_version> <ext>
# jdk_version: 8(default) or 9
# ext: rpm or tar.gz

if [[ $EUID -ne 0 ]]; then
   echo "your Not authorized to run  this script."
   exit 1
fi

jdk_version=${1:-8}
ext=${2:-rpm}

echo "Checking for Avaliable java-8 versions..."

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

echo "Downloading jdk-8-linux-x64.rpm..."

for dl_url in ${jdk_download_url4[@]}; do

    wget -O jdk-8-linux-x64.rpm  --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         -N $dl_url
done

echo "Assiginging permissions to jdk-8-linux-x64.rpm..."
chmod 777 jdk-8-linux-x64.rpm

echo "Installation..."
sudo yum localinstall jdk-8-linux-x64.rpm -y
echo "jdk-8-linux-x64.rpm installed Successfully....."

echo "Verifying the installation...."
java -version


#echo "Removing jdk-8-linux-x64.rpm....."
#rm jdk-8-linux-x64.rpm
