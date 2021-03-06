#!/bin/bash

function mk_dist()
{
    VERSION=$(git describe --tags)
    git archive --format=tar \
        --output wrf_install-$VERSION.tar \
        --prefix="wrf_install/"  $VERSION
    gzip wrf_install-$VERSION.tar
}

if [ -z "$1" ]; then
    mk_dist
else
    home_rev=$(git name-rev --name-only HEAD)
    git checkout "$1"
    mk_dist
    git checkout "$home_rev"
fi
