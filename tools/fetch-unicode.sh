#!/bin/bash

set -e

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"
ROOT=$(dirname "$ROOT")

REV=$1

tools/fetch-ucd.sh $REV
tools/fetch-uca.sh $REV
tools/fetch-uts39.sh $REV
tools/fetch-uts46.sh $REV
tools/fetch-uts51.sh $REV

git commit -S -m "Unicode $REV"
git tag -m "Unicode $REV" ucd-$REV
