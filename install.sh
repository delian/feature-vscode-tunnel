#!/bin/bash

set -e

mkdir -p ~/.code-server/bin
tar -zxvf <(curl -Lo - https://code.visualstudio.com/sha/download\?build\=stable\&os\=cli-alpine-x64) -C ~/.code-server/bin || { echo "Failed to download or extract the Visual Studio Code tarball."; exit 1; }

