#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

mkdir -p tmp
pushd tmp

FILES=$(curl -l "ftp://ftp.unicode.org/Public/UCA/$REV/")
for f in $FILES; do
    wget "ftp://ftp.unicode.org/Public/UCA/$REV/$f"
done

mkdir -p final
unzip CollationTest.zip -d final
mv $FILES final/
rm -rf final/CollationTest.zip

rm -rf "$ROOT/uca"
mv final "$ROOT/uca"

popd
rm -rf tmp

git add -A "$ROOT/uca"
