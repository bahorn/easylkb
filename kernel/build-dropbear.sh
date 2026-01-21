#!/bin/sh
git clone https://github.com/mkj/dropbear dropbear
cd dropbear
export CC=musl-gcc
export PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
./configure --enable-static \
      --disable-utmp \
      --disable-wtmp \
      --disable-lastlog \
      --disable-zlib
make PROGRAMS="$PROGRAMS" MULTI=1 STATIC=1 -j`nproc`
