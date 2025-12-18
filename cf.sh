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

# empty filename guard (added in v0.2.0)
if [ -z "$filename" ]; then
    echo "[WARN] Oops! You didn't type a filename."
    echo "Let's try again, please run the script and give me a name next time."
    exit 1
fi

# overwrite warning
if [ -f "$filename" ]; then
    echo "[WARN] Heads up! A file named \"$filename\" already exists."
    read -p "Do you want to overwrite it? (y/n): " choice
    if [ "$choice" != "y" ]; then
        echo "[MSG] No worries, I won't touch it. Exiting now."
        exit 0
    fi
fi 

echo "Great choice! We'll name it \"$filename\"."
echo

# ask for custom end marker
read -p "[ASK] What word should I treat as your 'done' marker? " endmarker
if [ -z "$endmarker" ]; then
    endmarker="END"
    echo "[WARN] You didn't give me a marker, so I'll use the default: END"
fi

# ask for the content
echo "Now, let's put something inside your file."
echo "Type as many lines as you want. (added in v0.2.0)"
echo "When you're done, just type: $endmarker"
echo "-------------------------------------------------"

# this needs to be here so we can let the user type multiple lines for whatever 
# reason
> "$filename"   # clear or create file
while true; do
    read line
    if [ "$line" == "$endmarker" ]; then
        break
    fi
    echo "$line" >> "$filename"
done
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