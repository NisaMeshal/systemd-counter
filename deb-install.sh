#!/usr/bin/bash

TEMP_DIR=temp
SERVICE=counterService.py
SYSTEM=counter.service

# make the directories if they don't exist
mkdir -p $TEMP_DIR # /temp
mkdir -p $TEMP_DIR/usr/local/bin 
mkdir -p $TEMP_DIR/lib/systemd/system
mkdir -p $TEMP_DIR/DEBIAN

# copy necessary files into directories
cp ./bin/$SERVICE $TEMP_DIR/usr/local/bin 
cp ./$SYSTEM $TEMP_DIR/lib/systemd/system

# copy from debian to temp/debian
cp DEBIAN/control $TEMP_DIR/DEBIAN

cp DEBIAN/postinst $TEMP_DIR/DEBIAN
chmod 775 $TEMP_DIR/DEBIAN/postinst

cp DEBIAN/prerm $TEMP_DIR/DEBIAN
chmod 775 $TEMP_DIR/DEBIAN/prerm

cp DEBIAN/postrm $TEMP_DIR/DEBIAN
chmod 775 $TEMP_DIR/DEBIAN/postrm

# build 
dpkg-deb --root-owner-group --build $TEMP_DIR
mv $TEMP_DIR.deb counter-v2.0.0.deb