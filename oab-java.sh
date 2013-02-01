echo This script was made by Ryan Norris. Please do not edit this script.
echo By running this script, you agree with the terms and conditions set forth by
echo Oracle.
echo
echo
echo
echo Initializing, please wait...
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
echo Ill be pulling the files from my GitHub necessary to install Java...
echo
echo 
wget https://dl.dropbox.com/s/99el407p85b2bzd/jdk-6u38-linux-x64.bin?dl=1
mv jdk-6u38-linux-x64.bin?dl=1 jdk-6u38-linux-x64.bin
echo Download Completed, lets set some permissions...
chmod a+x jdk-6u38-linux-x64.bin
echo
echo
echo
echo Lets unpack Java now...
./jdk-6u38-linux-x64.bin
echo
echo
echo Java has been unpacked. Please hold on...
mkdir -p /usr/lib/jvm/
mv jdk1.6.0_38 /usr/lib/jvm/jdk1.6.0_38
echo
echo
echo
echo Okay, the hard part is done. Lets set Oracle Java as the default
echo java.
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_38/bin/javac 1
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_38/bin/java 1
update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_38/bin/javaws 1
update-alternatives --config javac 1
update-alternatives --config java 1
update-alternatives --config javaws 1
ls -la /etc/alternatives/java*
JAVA_HOME=/usr/lib/jvm/jdk1.6.0_38
MOZILLA_HOME=~/.mozilla
mkdir $MOZILLA_HOME/plugins
ln -s $JAVA_HOME/jre/lib/amd64/libnpjp2.so $MOZILLA_HOME/plugins
echo
echo
echo Congrats, Java is installed. Now lets test it...
java -version
echo Test complete.
echo Enjoy Java!
