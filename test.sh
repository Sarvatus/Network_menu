#!/bin/bash

Red="\e[0;31m"

while [ "$option" !=  "exit" ]  ; do
echo "Choose what do You want:"

echo "1. Show Your address IP"
echo "2. Show Your hostname"
echo "3. Show list of users"
echo "4. Show list of groups"
echo "5. Show listening ports"
echo "6. Show DNS"
echo "Write exit to leave menu"

read -p "option:" option 

case "$option" in

"1") clear ; echo "-------------"; echo "Your address/es IP:      "  " $(hostname -I)" ; echo "";;
"2") clear ; echo "-------------"; echo "Your hostname is:      ""$(hostname )" ; echo "";;
"3") clear ; echo "-------------"; echo "List of users:     "; echo""  "$(sudo cat /etc/passwd | cut -d: -f1 | sort)" ; echo "";;
"4") clear ; echo "-------------"; echo "List of groups:      "; echo"" "$(sudo cat /etc/group | cut -d: -f1 | sort)" ; echo "";;
"5") clear ; echo "-------------"; echo "Listening ports:      ""$(sudo netstat -tupln)" ; echo "";;
"6") clear ; echo "-------------"; echo "Your DNS is:      ""$(hostname -d)" ; echo "";;
"exit") echo "Bye"; sleep 1;  clear ;; 
*) echo "Write correct number" 


esac

done
