#! /bin/bash
# Description: 2-2-4
# Writed by chi
# Version: v2.00

declare -A addrBook

varKey=1
while [ $varKey != 4 ]
do
  touch ./addr.book
  cat ./addr.book | while read LINE
  do
    varName=${LINE%:*}
    varAddr=${LINE#*:}
    addrBook[$varName]=$varAddr
  done

  echo "***********************************"
  echo "*       Address Book System       *"
  echo "***********************************"
  echo "*    (1) Sign On                  *"
  echo "*    (2) Query                    *"
  echo "*    (3) Clean the List           *"
  echo "*    (4) Exit                     *"
  echo "***********************************"
  read -n 1 -p "   Select Function:  " varCho
  echo ""

  case $varCho in
    1)
      echo -e "   \"exit\" for leaving....\n"

      read -p "Enter NAME:    " varName
      [ $varName == "exit" ] && exit 0
      read -p "Enter Address: " varAddr

      addrBook[$varName]=$varAddr

      for i in ${!addrBook[*]}
      do
        echo "$i:${addrBook[$i]}" >> ./addr.book
      done
    ;;
    2)
      read -p "Enter NAME:    " varName
      echo -n "Address:       "
      cat ./addr.book | grep $varName | sed "s/^$varName://g"
      echo ""
      read -s -n 1 -p "press any key to quit...."
      echo ""
    ;;
    3)  echo "[address book]" > ./addr.book ; read -s -n 1 -p "press any key to quit...." ; echo ""  ;;
    4)  read -s -n 1 -p "press any key to quit...." ; echo ""  ;;
    *)  echo "   !!!!Bad Input!!!"
  esac
done

exit 0