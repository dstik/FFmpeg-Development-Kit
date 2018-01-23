#!/bin/bash
SYSROOT=$NDK/platforms/android-21/arch-arm64/
TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64
rm -f $(pwd)/compat/strtod.o
function build_one
{
./configure \
--prefix=$PREFIX $COMMON $CONFIGURATION \
--cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
--target-os=linux \
--arch=aarch64 \
--enable-cross-compile \
--enable-libx264 \
--enable-libass \
--enable-libfreetype \
--enable-libfribidi \
--enable-libmp3lame \
--enable-fontconfig \
--enable-pthreads \
--disable-debug \
--disable-ffserver \
--enable-version3 \
--enable-hardcoded-tables \
--disable-ffplay \
--disable-ffprobe \
--enable-gpl \
--enable-yasm \
--disable-doc \
--disable-shared \
--sysroot=$SYSROOT \
--extra-cflags="-O3 -DANDROID -Dipv6mr_interface=ipv6mr_ifindex -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing $ADDI_CFLAGS" \
--extra-ldflags="-Wl,-rpath-link=$SYSROOT/usr/lib -L$SYSROOT/usr/lib -nostdlib -lc -lm -ldl -llog $ADDI_LDFLAGS"

make clean
make -j${NUMBER_OF_CORES}
make install
}

export CPU=arm64-v8a
PREFIX=$(pwd)/android/$CPU 
build_one
cp Android.mk $PREFIX/Android.mk
cd $PROJECT_JNI
export ABI=$CPU
export PLATFORM="android-21"
ndk-build
cp -r "$PROJECT_LIBS/$CPU" "$PROJECT_LIBS/../out" 
cd $DIR
