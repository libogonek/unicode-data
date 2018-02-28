#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

mkdir -p tmp
pushd tmp

wget "https://www.unicode.org/Public/$REV/ucd/UCD.zip"
wget "https://www.unicode.org/Public/$REV/ucd/Unihan.zip"

mkdir -p final
unzip UCD.zip -d final
unzip Unihan.zip -d final

rm -rf "$ROOT/ucd"
mv final "$ROOT/ucd"

popd
rm -rf tmp

git add -A "$ROOT/ucd"
