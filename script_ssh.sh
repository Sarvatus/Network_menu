#!/bin/bash

echo "Echo"

DIRECTORY=/.ssh
#echo "$DIRECTORY AAAA"

if [ -d "$DIRECTORY" ]; then
echo "DIRECTORY $DIRECTORY EXISTS"

else
$(mkdir $DIRECTORY)
fi

FILE=/.ssh/authorized_keys
if [ -f "$FILE" ]; then 

echo "File $FILE EXISTS"

else 
$(touch "$DIRECTORY"/authorized_keys)
$(chmod 600 /.ssh/authorized_keys)

fi
