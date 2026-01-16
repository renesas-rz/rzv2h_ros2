#!/bin/sh

sudo python3 patch_sdk.py

SYSROOT="/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux"

cd $SYSROOT/usr/include/c++/13.4.0

FILES=`grep -Rl "^#include_next"`
for FILE in $FILES
do
    echo $FILE
    sudo cp $FILE $FILE.backup
    cat $FILE | sed 's/include_next/include/g' > /tmp/wk
    sudo cp /tmp/wk $FILE
    rm /tmp/wk
done
