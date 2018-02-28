#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

mkdir -p tmp
pushd tmp

FILES=$(curl -l "ftp://ftp.unicode.org/Public/idna/$REV/")
for f in $FILES; do
    wget "ftp://ftp.unicode.org/Public/idna/$REV/$f"
done

mkdir -p final
mv $FILES final/

rm -rf "$ROOT/idna"
mv final "$ROOT/idna"

popd
rm -rf tmp

git add -A "$ROOT/idna"
