#!/bin/bash
# author: Noah Juopperi <noahjuopperi.contact@gmail.com>

echo "-------------------------------------------------------"
echo "              File Creator (v0.2)                      "
echo " Wassup, I create files for you when you're lazy.      "
echo " I may not be the most advanced but my creator is good."
echo "-------------------------------------------------------"
echo

# what's the name of the file
read -p "What should we call your file? " filename

echo "Great choice! We'll name it \"$filename\"."
echo 

# ask for the content
echo "Now, let's put something inside your file."
echo "Type as many lines as you want"
# i ran out of comments
echo "$filecon" > "$filename"

# because the user is probably a bit drunk since they forgot touch exists
# we'll give them some feedback
echo
echo "All is done! I just created \"$filename\" for you."
echo "Here's what it looks like inside:"
echo "-------------------------------------------------"
cat "$filename"
echo "-------------------------------------------------"

# closing message
echo
echo "Thanks for using me! I'll be ready next time."