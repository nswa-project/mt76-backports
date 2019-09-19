#!/bin/bash

OWRT_DIR=${OWRT_DIR:-../openwrt}

unpack() {
	mkdir -p "rootfs/${1}/tmp"
	${OWRT_DIR}/staging_dir/host/bin/opkg --offline-root "rootfs/${1}" --force-depends install build/"${1}"/*.ipk
	rm -rf "rootfs/${1}/tmp" "rootfs/${1}/usr/lib/opkg"
	find "rootfs/${1}" -empty -type d -delete
}

rm -rf rootfs
mkdir -p rootfs

unpack mt7620
unpack mt7621
