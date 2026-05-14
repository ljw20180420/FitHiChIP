#!/bin/bash

version=$1
if [ -z "${version}" ]
then
    echo "no version provide"
    exit 1
fi

git commit -am "release ${version}"
git push
gh release create "${version}" \
    --generate-notes \
    --fail-on-no-commits
git fetch --tags origin
