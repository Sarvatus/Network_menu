#!/bin/bash

# Check if directory /.ssh exists 

DIRECTORY="/.ssh"
check_existing() {
echo "Checking if $DIRECTORY  exists..."
if [ -d "$DIRECTORY" ]; then
echo "DIRECTORY $DIRECTORY EXISTS"

else
echo "Creating $DIRECTORY and changing permission to 700"
$(mkdir $DIRECTORY)
$(chmod 700 $DIRECTORY)
fi
}


#FILE=/.ssh/authorized_keys
#
#echo "Checking if $FILE exists..."
#if [ -f "$FILE" ]; then 
#
#echo "File $FILE EXISTS"
#
#else 
#echo "Creating $FILE and changing permission to 600"
#$(touch $FILE)
#$(chmod 600 /.ssh/authorized_keys)
#
#fi
#
#if [ $(stat -c %a /.ssh/authorized_keys) -eq "600" ]; then
#
#echo "file have permision 600"
#
#else
#echo "file have wrong permission"
#echo "Changing permissions to 600..."
#$(chmod 600 /.ssh/authorized_keys)
#fi
#
#echo "Generating new pair of RSA keys..."
#FILE_NAME="my.key"
#echo "$FILE_NAME"".pub"
#if [[  -f /.ssh/"$FILE_NAME" ]] || [[  -f /.ssh/"$FILE_NAME"".pub" ]]  ;then 
#echo "$FILE_NAME"".pub OR $FILE_NAME exists"
#fi
#if [[ ! -f /.ssh/"$FILE_NAME" ]] &&  [[ !  -f /.ssh/"$FILE_NAME"".pub" ]] ;then 
# 
#echo "Creating priv key"
#$(ssh-keygen -t rsa -N "" -f /.ssh/my.key)
#fi
#
##$( cat /.ssh/"$FILE_NAME"".pub" >> /.ssh/authorized_keys ) 
##$( rm -f /.ssh/"$FILE_NAME""
#
#ssh-copy-id -i "/.ssh/my.key.pub" 10.13.0.73
#

main() {

check_existing

}

main
