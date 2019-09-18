#!/bin/bash

OWRT_DIR=${OWRT_DIR:-../openwrt}

mkdir -p openwrt workdir upperdir

sudo mount -t overlay overlay -o "lowerdir=${OWRT_DIR},upperdir=upperdir,workdir=workdir" openwrt
