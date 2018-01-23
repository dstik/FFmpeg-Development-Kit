echo "Running setup."

sudo apt update
sudo apt-get --quiet --yes install build-essential git autoconf libtool pkg-config gperf gettext yasm python-lxml
sudo apt-get --quiet --yes install zlibc zlib1g-dev zlib1g libfontconfig1-dev libx264-dev libpng12-dev libass-dev libavcodec-dev libavcodec-extra libavcodec-ffmpeg-extra56 libavformat-dev libavutil-dev libfreetype6-dev libexpat1-dev
sudo apt-get --quiet --yes install unzip

wget https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip
unzip android-ndk-r14b-linux-x86_64.zip -d ~

cp -R ffmpeg ~/android-ndk-r14b/sources/
cp -R JNI ~
mkdir ~/JNI/app/libs

echo "Cool. Navigate to ~/android-ndk-r14b/sources/ffmpeg and run: ./build_all.sh"

