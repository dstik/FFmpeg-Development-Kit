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
mkdir ~/JNI/app/libs/arm64-v8a
mkdir ~/JNI/app/libs/armeabi
mkdir ~/JNI/app/libs/armeabi-v7a
mkdir ~/JNI/app/libs/x86
mkdir ~/JNI/app/libs/x86_64

mkdir ~/android-ndk-r14b/sources/ffmpeg/android
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/arm64-v8a
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/armeabi
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/armeabi-v7a
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/x86
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/x86_64

mkdir ~/android-ndk-r14b/sources/ffmpeg/android/arm64-v8a/lib
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/arm64-v8a/include
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/armeabi/lib
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/armeabi/include
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/armeabi-v7a/lib
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/armeabi-v7a/include
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/x86/lib
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/x86/include
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/x86_64/lib
mkdir ~/android-ndk-r14b/sources/ffmpeg/android/x86_64/include

echo "" >> ~/.bashrc
echo "export ANDROID_NDK=/home/ubuntu/android-ndk-r14b" >> ~/.bashrc
echo "export PATH=\$PATH:\$ANDROID_NDK" >> ~/.bashrc
echo "" >> ~/.bashrc

echo "Cool."
echo "1) Run: source ~/.bashrc"
echo "2) Navigate to ~/android-ndk-r14b/sources/ffmpeg and run: ./build_all.sh"

