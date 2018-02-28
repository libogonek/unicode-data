#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

mkdir -p tmp
pushd tmp

FILES=$(curl -l "ftp://ftp.unicode.org/Public/math/revision-$REV/")
for f in $FILES; do
    wget "ftp://ftp.unicode.org/Public/math/revision-$REV/$f"
done

mkdir -p final
mv $FILES final/

rm -rf "$ROOT/math"
mv final "$ROOT/math"

popd
rm -rf tmp

git add -A "$ROOT/math"
git commit -S -m "UTR #25 r$REV"
git tag -m "UTR #25 r$REV" utr25-r$REV
