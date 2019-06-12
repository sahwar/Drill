#!/bin/bash



sudo rm -rf Build
sudo rm *.rpm
mkdir Build

FILES="../../Tools/deb/Build/*"
for f in $FILES
do
    file_without_ext=$(basename "$f" .deb)
    sudo alien --to-rpm "$f" --target=amd64 --keep-version
    mv *.rpm "$file_without_ext".rpm
    mv "$file_without_ext".rpm Build
done

sudo chown -R "$(whoami)" Build



