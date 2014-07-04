#!/bin/sh

echo Java 7 Downloader for Linux
echo Copyright 2014 Norris Enterprises
echo
echo This script was made by Ryan Norris. Please do not edit this script.
echo By running this script, you agree with the terms and conditions set forth by
echo Oracle.
echo
clear
echo Please wait while we intialize the application...
echo Checking for previous Java versions...
echo yes | ls /usr/lib/jvm > /tmp/oabjava.ngel
cat /tmp/oabjava.ngel | grep jvm*
sudo apt-get remove openjdk*
clear
echo OpenJDK has been uninstalled if it was installed.
wait 5
echo About to remove Oracle JVM. One moment.
sudo rm -rf /usr/lib/jvm/
echo
clear
echo Oracle JVM has been removed.
wait 5
echo
echo Initializing, please wait...
sleep 3
echo
echo
echo
echo
echo
clear
echo
echo
clear
echo Ill be pulling the files from Oracle necessary to install Java...
echo
echo 
wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-linux-x64.tar.gz
echo Download Completed, lets set some permissions...
chmod 777 jdk-7u60-linux-x64.tar.gz
echo
echo
echo
echo Lets unpack Java now...
tar zxvf jdk-7u51-linux-x64.tar.gz
echo
echo
echo Java has been unpacked. Please hold on...
sudo mkdir -p /usr/lib/jvm/
sudo mv jdk1.7.0_60 /usr/lib/jvm/jdk1.7.0_60
clear
echo Oracle JVM has been downloaded and is ready to install.
clear
echo
echo
echo
echo Okay, the hard part is done. Lets set Oracle Java as the default
echo java.
wait 5
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.7.0_60/bin/javac 1
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_60/bin/java 1
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.7.0_60/bin/jar 1
sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.7.0_60/bin/javaws 1
sudo update-alternatives --config javac 1
sudo update-alternatives --config java 1
sudo update-alternatives --config javaws 1
sudo update-alternatives --config jar 1
ls -la /etc/alternatives/java*
clear
echo Done. Please wait..
wait 3
JAVA_HOME=/usr/lib/jvm/jdk1.7.0_60
MOZILLA_HOME=~/.mozilla
mkdir $MOZILLA_HOME/plugins
ln -s $JAVA_HOME/jre/lib/amd64/libnpjp2.so $MOZILLA_HOME/plugins
ln -s $JAVA_HOME /usr/lib/jvm/java-7-oracle
echo
echo
echo Congrats, Java is installed. Now lets test it...
java -version
echo Test complete.
echo Cleaning up after myself.
rm -rf oab-java.sh
rm -rf jdk*
echo Enjoy Java!
