#!/bin/bash



echo "Echo"

DIRECTORY=/.ssh
#echo "$DIRECTORY AAAA"


echo "Checking if $DIRECTORY  exists..."
if [ -d "$DIRECTORY" ]; then
echo "DIRECTORY $DIRECTORY EXISTS"

else
echo "Creating $DIRECTORY and changing permission to 700"
$(mkdir $DIRECTORY)
$(chmod 700 $DIRECTORY)
fi

FILE=/.ssh/authorized_keys

echo "Checking if $FILE exists..."
if [ -f "$FILE" ]; then 

echo "File $FILE EXISTS"

else 
echo "Creating $FILE and changing permission to 600"
$(touch "$DIRECTORY"/authorized_keys)
$(chmod 600 /.ssh/authorized_keys)

fi
echo $(stat -c %a /.ssh/authorized_keys) 

if [ $(stat -c %a /.ssh/authorized_keys) -eq "600" ]; then

echo "file have permision 600"

else
echo "file have wrong permission"
echo "Changing permissions to 600..."
$(chmod 600 /.ssh/authorized_keys)
fi
