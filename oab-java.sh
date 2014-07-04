#!/bin/sh

echo Java 6 Downloader for Linux
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
sudo rm -rf /usr/lib/jvm/
echo
clear
echo
echo
echo Initializing, please wait...
sleep 10
echo
echo
echo
echo
echo
echo This should download the latest version of Java 6. Java 6 is required
echo by many applications for compatibility reasons and to build
echo Android. There will be a Java 7 version soon.
echo
echo
echo Ill be pulling the files from my Dropbox necessary to install Java...
echo
echo 
wget https://dl.dropboxusercontent.com/s/90dfp613kq2xvam/jdk-6u45-linux-x64.bin?dl=1 --no-check-certificate
mv jdk-6u45-linux-x64.bin?dl=1 jdk-6u45-linux-x64.bin
echo Download Completed, lets set some permissions...
chmod a+x jdk-6u45-linux-x64.bin
echo
echo
echo
echo Lets unpack Java now...
./jdk-6u45-linux-x64.bin
echo
echo
echo Java has been unpacked. Please hold on...
sudo mkdir -p /usr/lib/jvm/
sudo mv jdk1.6.0_45 /usr/lib/jvm/jdk1.6.0_45
echo
echo
echo
echo Okay, the hard part is done. Lets set Oracle Java as the default
echo java.
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_45/bin/javac 1
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_45/bin/java 1
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk1.6.0_45/bin/jar 1
sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_45/bin/javaws 1
sudo update-alternatives --config javac 1
sudo update-alternatives --config java 1
sudo update-alternatives --config javaws 1
sudo update-alternatives --config jar 1
ls -la /etc/alternatives/java*
JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45
MOZILLA_HOME=~/.mozilla
mkdir $MOZILLA_HOME/plugins
ln -s $JAVA_HOME/jre/lib/amd64/libnpjp2.so $MOZILLA_HOME/plugins
echo
echo
echo Congrats, Java is installed. Now lets test it...
java -version
echo Test complete.
echo Cleaning up after myself.
rm -rf oab-java.sh
rm -rf jdk-6u45-linux-x64.bin
echo Enjoy Java!
echo Moving log to desktop. If an error occured, send it to nigeluno@projectopencannibal.org.
mv /tmp/oabjava.ngel ~/Desktop/java.ngel
