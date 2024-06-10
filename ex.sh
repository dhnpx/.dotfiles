#! /bin/sh

ARG=$1

if [ "$ARG" = 'laptop' ]; then 
    echo $ARG
else
    echo "Not laptop"
fi
