#!/bin/bash

DRIVER_DIR=/opt/Nvidia/${1}

DIRS=$(find ${DRIVER_DIR} -type d | sed "s|${DRIVER_DIR}||")

for DIR in ${DIRS[*]}
do
    mkdir -p ${DIR}
done

FILES=$(find ${DRIVER_DIR} -type f | sed "s|${DRIVER_DIR}||")

for FILE in ${FILES[*]}
do
    ln -sf ${DRIVER_DIR}${FILE} ${FILE}
done

LINKS=$(find ${DRIVER_DIR} -type l | sed "s|${DRIVER_DIR}||")

for LINK in ${LINKS[*]}
do
    cp -df ${DRIVER_DIR}${LINK} ${LINK}
done

ln -sf ${DRIVER_DIR}/../nvidia-config.desktop /usr/share/applications/nvidia-config.desktop

exit 0