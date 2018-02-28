#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

mkdir -p tmp
pushd tmp

wget "https://www.unicode.org/Public/security/$REV/uts39-data-$REV.zip"

mkdir -p final

unzip uts39-data-$REV.zip -d final

rm -rf "$ROOT/security"
mv final "$ROOT/security"

popd
rm -rf tmp

git add -A "$ROOT/security"
