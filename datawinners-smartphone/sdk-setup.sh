cd ../../
#wget http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
tar xvzf android-sdk_r24.0.2-linux.tgz
cd android-sdk-linux
./tools/android update sdk --no-ui --filter `./tools/android list sdk | grep 'SDK Platform Android 4.4.2, API 19, revision 4' | cut -c 3-4`
./tools/android update sdk --no-ui --filter `./tools/android list sdk | grep 'Android SDK Platform-tools, revision 21' | cut -c 3-4`
./tools/android update sdk --no-ui --filter `./tools/android list sdk | grep 'Android SDK Tools, revision 23.0.2' | cut -c 3-4`
./tools/android update sdk --no-ui --filter `./tools/android list sdk | grep 'Google APIs (ARM System Image), Android API 19, revision 10' | cut -c 3-4`
./tools/android update sdk --no-ui --filter `./tools/android list sdk | grep 'Google APIs, Android API 19, revision 2' | cut -c 3-4`
./tools/android update sdk --no-ui --filter `./tools/android list sdk | grep 'Android SDK Build-tools, revision 21.1.2' | cut -c 3-4`
./tools/android update sdk --no-ui --filter `./tools/android list sdk | grep 'Google Play services, revision 22' | cut -c 3-4`
cp -r extras/google/google_play_services/libproject/google-play-services_lib/ ../datawinners-smartphone/datawinners-smartphone/playservices

echo "export PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:`pwd`/platform-tools:`pwd`/tools" >> ~/.bashrc
echo "export ANDROID_HOME=`pwd`" >> ~/.bashrc
. ~/.bashrc

sudo apt-get -y install lib32stdc++6
sudo apt-get -y install lib32z1
cp ../datawinners-smartphone/datawinners-smartphone/build-playservices.xml ../datawinners-smartphone/datawinners-smartphone/playservices/build.xml
cd tools
android update project --name datawinners-smartphone --target 2 --path ../../datawinners-smartphone/datawinners-smartphone --subprojects
