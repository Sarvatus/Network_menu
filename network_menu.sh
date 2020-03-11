#!/bin/bash

clear;
echo " ";
echo " "; echo " "

menu () {
echo "-----Network-Menu-----";
echo "1. Show Available Networks"
echo "2. Change Address IP"
echo "3. Configure New Network Profile"


read -p "Option: " option

case $option in
 
"1") clear;  avail_netw ;;
"2") clear; chang_ip ;;
"3") clear; conf_netw ;;
"exit") clear ;;

esac

}

avail_netw () {

ip addr	

echo " "
read -p "Write back to back: " back

if [ $back == "back" ]; then
clear
menu 

fi 

}

chang_ip () {

echo "Available Network Profiles:"
echo ""

nmcli connection show --active
i=1
for uu in $(nmcli connection show --active | awk ' { print $1 } ') ;do
if [ ${uu[0]} == "NAME" ] ; then
echo ""
else
echo ""
echo "--------"
echo $i"." $uu
x+=($uu)
echo $(nmcli connection show "$uu" | grep ipv4.addresses  )

((i++))
fi
done
echo ${x[@]}
read -p "Choose profile which IP you wanna change: " iprofil
clear

chos_prof=${x[$iprofil-1]}
echo "You choosed profile: " $chos_prof 

echo "" 
echo $(nmcli connection show $chos_prof | grep -e "ipv4.addresses" )
echo " "
read -p "Type Your new IPv4 address: " ipaddr
read -p "Please type lenght of mask: " len_mask
nmcli connection modify $chos_prof ipv4.address "$ipaddr""/""$len_mask"



 
}










main (){

menu

}


main
