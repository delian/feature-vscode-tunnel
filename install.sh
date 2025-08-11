#!/bin/bash

set -e

mkdir -p ~/.code-server/bin
tar -zxvf <(curl -Lo - https://code.visualstudio.com/sha/download\?build\=stable\&os\=cli-alpine-x64) -C ~/.code-server/bin || { echo "Failed to download or extract the Visual Studio Code tarball."; exit 1; }

cat << EOF > ~/.code-server/bin/start.sh
#!/bin/bash

~/.code-server/bin/code --verbose --cli-data-dir ~/.vscode/cli tunnel --accept-server-license-terms --name ${1:-$(hostname)} service internal-run
EOF

chmod +x ~/.code-server/bin/start.sh
mkdir -p ~/.code-data

echo "Create a postStartCommand in your devcontainer.json file to start code-server tunnel automatically."
echo "It shall be something like this:"
echo '{
  "postStartCommand": "~/.code-server/bin/start.sh mycontainername"
}'
