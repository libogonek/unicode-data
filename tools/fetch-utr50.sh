#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

mkdir -p tmp
pushd tmp

FILES=$(curl -l "ftp://ftp.unicode.org/Public/vertical/revision-$REV/")
for f in $FILES; do
    wget "ftp://ftp.unicode.org/Public/vertical/revision-$REV/$f"
done

mkdir -p final
mv $FILES final/

rm -rf "$ROOT/vertical"
mv final "$ROOT/vertical"

popd
rm -rf tmp

git add -A "$ROOT/vertical"
git commit -S -m "UTR #50 r$REV"
git tag -m "UTR #50 r$REV" utr50-r$REV
