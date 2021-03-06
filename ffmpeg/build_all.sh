#!/bin/bash
export DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT="$(dirname "${DIR}")"
export NDK="$(dirname "${PARENT}")"
export PATH="$PATH:$NDK"
export PROJECT_JNI="$(dirname "${NDK}")/JNI/app/jni"
export PROJECT_LIBS="$(dirname "${NDK}")/JNI/app/libs"
#export CONFIGURATION="pass here additional configuration flags if you want to"
export ADDI_CFLAGS="-fPIC"
export ADDI_LDFLAGS="-Wl,-z,defs"
export COMMON="--disable-static --disable-programs --disable-doc --enable-shared --enable-protocol=file --enable-pic --enable-small"
export NUMBER_OF_CORES=$(nproc)

echo "DIR: $DIR"
echo "NDK: $NDK"
echo "PATH: $PATH"
echo "PROJECT_JNI: $PROJECT_JNI"
echo "PROJECT_LIBS: $PROJECT_LIBS"
echo "NUMBER_OF_CORES: $NUMBER_OF_CORES"

./build_armeabi.sh
./build_armeabi-v7a.sh
./build_arm64-v8a.sh
./build_x86.sh
./build_x86_64.sh
