#!/bin/bash

BLK_MAJOR=$2
BLK_MINOR=$3

stap -v -d kernel -DSTP_NO_BUILDID_CHECK ./$1 $BLK_MAJOR $BLK_MINOR -g
