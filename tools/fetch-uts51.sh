#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1
PATCH=${REV##*.}
if [ "$PATCH" -eq "0" ]; then
    REV="${REV%.*}"
fi

mkdir -p tmp
pushd tmp

FILES=$(curl -l "ftp://ftp.unicode.org/Public/emoji/$REV/")
for f in $FILES; do
    wget "ftp://ftp.unicode.org/Public/emoji/$REV/$f"
done

mkdir -p final
mv $FILES final/

rm -rf "$ROOT/emoji"
mv final "$ROOT/emoji"

popd
rm -rf tmp

git add -A "$ROOT/emoji"
