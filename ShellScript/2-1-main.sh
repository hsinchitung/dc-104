#! /bin/bash
# Description: 2-1-main
# Writed by chi
# Version: v1.00

varCho=1
while [ $varCho != 4 ]
do
  echo "                 Chapter 2-1                 "
  echo "*********************************************"
  echo "*     Which script you want test first?     *"
  echo "*********************************************"
  echo "*       (1) 2-1-12        (2) 2-1-13        *"
  echo "*                                           *"
  echo "*       (3) 2-1-14        (4) exit          *"
  echo "*********************************************"
  read -n 1 -p "   Choose:  " varCho
  echo ""

  case $varCho in
    1)  ./2-1-12.sh  ;;
    2)  ./2-1-13.sh  ;;
    3)  ./2-1-14.sh  ;;
    4)  echo -e "\nThank you!"  ;;
    *)  echo -e "\a\nTry other options!!"  ;;
  esac
  echo -e "Press any key to continue....\n\n"
  read -s -n 1
  clear
done

exit 0