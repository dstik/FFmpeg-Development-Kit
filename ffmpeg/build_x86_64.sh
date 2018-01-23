#!/bin/bash
SYSROOT=$NDK/platforms/android-21/arch-x86_64/
TOOLCHAIN=$NDK/toolchains/x86_64-4.9/prebuilt/linux-x86_64
rm -f $(pwd)/compat/strtod.o
function build_one
{
./configure \
--prefix=$PREFIX $COMMON $CONFIGURATION \
--cross-prefix=$TOOLCHAIN/bin/x86_64-linux-android- \
--target-os=linux \
--arch=x86_64 \
--disable-asm \
--sysroot=$SYSROOT \
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
--extra-cflags="-O3 -Wall -pipe -DANDROID -DNDEBUG  -march=atom -msse3 -ffast-math -mfpmath=sse $ADDI_CFLAGS" \
--extra-ldflags="-lm -lz -Wl,--no-undefined -Wl,-z,noexecstack $ADDI_LDFLAGS"

make clean
make -j${NUMBER_OF_CORES}
make install
}

export CPU=x86_64
PREFIX=$(pwd)/android/$CPU
build_one
cp Android.mk $PREFIX/Android.mk
cd $PROJECT_JNI
export ABI=$CPU
export PLATFORM="android-21"
ndk-build
cp -r "$PROJECT_LIBS/$CPU" "$PROJECT_LIBS/../out"
cd $DIR
