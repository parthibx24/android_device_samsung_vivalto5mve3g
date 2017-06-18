#!/bin/sh

VENDOR=samsung
DEVICE=vivalto5mve3g

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling device files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp ../../../../stock\ G316HU/$FILE $BASE/$FILE
    echo "$FILE pulled"
done

./setup-makefiles.sh
