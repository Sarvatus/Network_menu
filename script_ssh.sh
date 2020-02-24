#!/bin/bash

menu () {
clear
echo "####### SSHTOM #######"
echo " "
echo "1. Check existing of ~/.ssh directory"
echo "2. Create ssh public and private keys and copy them to Your remote server"
echo "3. Try Your remote connection"
echo " "
echo "Write exit to leave menu"

read -p "Option: " option

case "$option" in

"1") clear ; check_existing ;;
"2") clear ; generating ;;
"3") clear ; remote ;; 
"exit") clear ; echo "Bye" ; sleep1; clear ;;
*)  clear ; echo "Write correct option!"
esac
}



# Check  directory /.ssh exists 

DIRECTORY="/root/.ssh"
check_existing() {
echo "Checking existing of $DIRECTORY  "
echo " "
if [ -d "$DIRECTORY" ]; then
echo "DIRECTORY $DIRECTORY":" EXISTS!"
echo "Check out directory ~/.ssh  and comeback to script!"
 

else
echo "Creating $DIRECTORY and changing permission to 700"
$(mkdir $DIRECTORY)
$(chmod 700 $DIRECTORY)
fi

echo " "
echo "1. Back to menu"
read -p "Option:  " back
case $back in 
"1") menu ;;
esac 
}

generating () {
echo "Generating new pair of RSA keys..."
read -p "Write name of private key (SERVER IP): " FILE_NAME
if [[  -f /root/.ssh/"$FILE_NAME" ]] || [[  -f /root/.ssh/"$FILE_NAME"".pub" ]]  ;then 
echo "$FILE_NAME"".pub OR $FILE_NAME    EXISTS!"
sleep 1 ; clear;
echo "CHECK OUT directory ~/.ssh  and comeback to script!"
sleep 2 ; exit
fi
if [[ ! -f /root/.ssh/"$FILE_NAME" ]] &&  [[ !  -f /root/.ssh/"$FILE_NAME"".pub" ]] ;then 
 
echo "Creating priv key"
$(ssh-keygen -t rsa -b 2048 -N "" -f /root/.ssh/"$FILE_NAME")
fi

eval $(ssh-agent)
$(ssh-add ~/.ssh/"$FILE_NAME")
if [ $(ssh-copy-id -i "/root/.ssh/""$FILE_NAME"".pub" "$FILE_NAME") ] ; then

echo "Success!"

echo "To connect with Your remote server write Yes"
read -p "Option: " choose
if [ $choose == "Yes" ] ;then
 
ssh -vvv $ip_addr
fi
fi
echo " "
echo "1. Back to menu"
read -p "Option: " back

case $back in
 
"1") menu ;;
esac 
}


 
main() {

menu
}

main
