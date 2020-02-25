#!/bin/bash

menu () {
clear
echo "####### SSHTOM #######"
echo "Easy way to create SSH connection without password to any server"
echo " "
echo "1. Check existing of ~/.ssh directory"
echo "2. Generate SSH keys and copy to authorized_keys on Your remote server"
echo " "
echo "Write exit to leave menu"

read -p "Option: " option

case "$option" in

"1") clear ; check_existing ;;
"2") clear ; generating ;;
"exit") clear ; echo "Bye" ; sleep1; clear ;;
*)  clear ; echo "Write correct option!" ; menu 
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
if [[  -f ~/.ssh/"$FILE_NAME" ]] || [[  -f ~/.ssh/"$FILE_NAME"".pub" ]]  ;then 
echo "$FILE_NAME"".pub OR $FILE_NAME    EXISTS!"
sleep 1 ; clear;
echo "CHECK OUT directory ~/.ssh  and comeback to script!"
sleep 2 ; exit

else  
echo "Creating priv key"
$(ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/"$FILE_NAME")

if [ -f ~/.ssh/config ] ; then

echo -e "Host $FILE_NAME \n IdentityFile ~/.ssh/"$FILE_NAME"" >> ~/.ssh/config
systemctl restart sshd ; sleep 5; clear  echo "wait!"
fi
$(ssh-copy-id -i ~/.ssh/"$FILE_NAME"".pub" "$FILE_NAME") 


echo "Success!"

echo "To connect with Your remote server write Yes"
read -p "Option: " choose
if [ $choose == "Yes" ] ;then
 
ssh -vvv $FILE_NAME
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
