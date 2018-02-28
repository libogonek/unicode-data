#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

mkdir -p tmp
pushd tmp

wget "https://www.unicode.org/Public/cldr/$REV/core.zip"
wget "https://www.unicode.org/Public/cldr/$REV/keyboards.zip"

mkdir -p core keyboards
unzip core.zip -d core
unzip keyboards.zip -d keyboards

mkdir -p final

mv core/common/* final/
mv keyboards/keyboards final/

rm -rf "$ROOT/cldr"
mv final "$ROOT/cldr"

popd
rm -rf tmp

git add -A "$ROOT/cldr"
git commit -S -m "CLDR $REV"
git tag -m "CLDR $REV" cldr-$REV
