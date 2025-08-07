#!/bin/bash

mkdir -p ~/.code-server/bin

tar -zxvf <(curl -Lo - https://code.visualstudio.com/sha/download\?build\=stable\&os\=cli-alpine-x64) -C ~/.code-server/bin
if [ $? -ne 0 ]; then
    echo "Failed to download or extract the Visual Studio Code tarball."
    exit 1
fi

