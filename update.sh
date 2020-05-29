#!/bin/sh
set -euf pipefail
stuffDir=$HOME/.local/share/thoughts
binDir=$HOME/.local/bin

###
### This script must handle *all* "update" steps
### because it reinstalls its own caller (thoughts itself)
###

#cp "$stuffDir"/thoughts-temp/.foot.html "$stuffDir"
#echo "copied foot"
#cp "$stuffDir"/thoughts-temp/README.md "$stuffDir"
#echo "copied readme"
#cp "$stuffDir"/thoughts-temp/parse.awk "$stuffDir"/bin
#echo "copied parse"
#cp "$stuffDir"/thoughts-temp/thoughts "$binDir"
#echo "copied thoughts itself"
#chmod +x "$binDir"/thoughts
#echo "chmod thoughts"

# Handle the possibility of overwriting user's custom CSS
echo
if ! diff "$stuffDir"/thoughts-temp/.head.html "$stuffDir"/.head.html; then
    echo "WARNING:"
    echo "The CSS in this release is different than what you currently have."
    echo "It could be upstream updates, or maybe you made some customizations."
    echo "Check out the diff above."
    echo
    echo "If you haven't made custom CSS changes, you can safely overwrite and install."
    echo
    printf "DO YOU WANT TO OVERWRITE AND INSTALL? [y/n]:"
    read -r reply
    if [ "$reply" = "y" ]; then
        cp "$stuffDir"/thoughts-temp/.head.html "$stuffDir"
	echo
	echo "CSS overwritten and installed. You're good to go!"
    else
        cp "$stuffDir"/thoughts-temp/.head.html "$stuffDir"/.head-new.html
        echo
	echo "We did not overwrite the CSS."
        echo "New CSS is in $HOME/.local/share/thoughts/.head-new.html"
	echo "And you'll need to update the CSS yourself with \"thoughts style\""
    fi
fi
rm -rf "$stuffDir"/thoughts-temp
echo
echo "Done updating!"
exit 0
