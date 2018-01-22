echo "Running setup."

sudo apt update
sudo apt-get --quiet --yes install build-essential git autoconf libtool pkg-config gperf gettext yasm python-lxml
sudo apt-get --quiet --yes install unzip

wget https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip
unzip android-ndk-r14b-linux-x86_64.zip -d ~

cp -R ffmpeg ~/android-ndk-r14b/sources/
cp -R JNI ~
mkdir ~/JNI/app/libs

echo "Cool. Navigate to ~/android-ndk-r14b/sources/ffmpeg and run: ./build_all.sh"
