#!/bin/bash

me=$(readlink -f $0)
parent=$(dirname $me)
distname=$(basename $parent)

build=$parent/build

. $parent/dist.version

[ -d "$build" ] && echo "Removing $build" && rm -rf "$build"

scripts=$build/$distname/$version
mkdir -p "$scripts"

cp $parent/src/* $scripts/
chmod +x $scripts/*.py

cd $build
tar zcf $distname-$version.tar.gz $distname
