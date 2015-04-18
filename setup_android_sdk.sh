#!/bin/sh

sudo apt-get update -qq
if [ `uname -m` = x86_64 ]; then sudo apt-get install -qq --force-yes libgd2-xpm ia32-libs ia32-libs-multiarch lib32stdc++6 lib32z1 > /dev/null; fi
#sudo apt-get install -y lib32stdc++6 lib32z1
wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
#wget https://s3-ap-southeast-1.amazonaws.com/download.mysquar.com/tools/android-sdk_r23.0.2-linux.tgz
tar -zxf android-sdk_r23.0.2-linux.tgz
export ANDROID_HOME=`pwd`/android-sdk-linux
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
echo y | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter "tools,platform-tools"
echo y | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter "android-20,android-21,build-tools-21.1.2"
echo "sdk.dir=$ANDROID_HOME" > local.properties
