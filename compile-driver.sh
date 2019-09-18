#!/bin/bash

JOBS=${JOBS:-2}

compile() {
	cp "../configs/$1" .config
	make defconfig
	make package/kernel/mac80211/compile -j${JOBS}
	make package/kernel/mt76/compile -j${JOBS}
	mkdir -p "../build/$1"
	cp bin/targets/ramips/"${1}"/packages/kmod-{cfg80211,mac80211,rt2800,mt76}*.ipk "../build/$1"
}

if ! mountpoint openwrt ; then
	exit 1
fi

rm -rf openwrt/package/kernel/{mac80211,mt76}
cp -r origin/{mac80211,mt76} openwrt/package/kernel/

rm -rf build
cd openwrt || exit 1

compile mt7620
compile mt7621
