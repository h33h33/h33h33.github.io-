#!/bin/sh
set -euf pipefail

cp "$stuffDir"/thoughts-temp/.head.html "$stuffDir"
cp "$stuffDir"/thoughts-temp/.foot.html "$stuffDir"
cp "$stuffDir"/thoughts-temp/README.md "$stuffDir"
cp "$stuffDir"/thoughts-temp/parse.awk "$stuffDir"/bin
cp "$stuffDir"/thoughts-temp/thoughts "$binDir"
chmod +x "$binDir"/thoughts
