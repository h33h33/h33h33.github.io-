#!/bin/sh
set -euf pipefail
stuffDir=$HOME/.local/share/thoughts
binDir=$HOME/.local/bin

###
### This script must handle *all* "update" steps
### because it reinstalls its own caller (thoughts itself)
###

cp "$stuffDir"/thoughts-temp/.foot.html "$stuffDir"
cp "$stuffDir"/thoughts-temp/README.md "$stuffDir"
cp "$stuffDir"/thoughts-temp/parse.awk "$stuffDir"/bin
cp "$stuffDir"/thoughts-temp/thoughts "$binDir"
chmod +x "$binDir"/thoughts
mv "$stuffDir"/.head.html "$stuffDir"/.head-old.html
cp "$stuffDir"/thoughts-temp/.head.html "$stuffDir"
echo
echo "Your old CSS was moved to $stuffDir/.head-old.html"
echo "If you made customizations, go there and diff it against .head.html"
echo "Then sort out the situation with 'thoughts style'"

rm -rf "$stuffDir"/thoughts-temp
cd "$stuffDir"
git add .
git commit -m "update css"
git push
echo
echo "Done!"
exit 0
