#! /bin/bash
# Description: 2-2-main
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

varCho=1
while [ $varCho != 4 ]
do
  echo "                 Chapter 2-2                 "
  echo "*********************************************"
  echo "*     Which script you want test first?     *"
  echo "*********************************************"
  echo "*       (1) 2-2-4         (2) 2-2-7         *"
  echo "*                                           *"
  echo "*       (3) 2-1-9         (4) exit          *"
  echo "*********************************************"
  read -n 1 -p "   Choose:  " varCho
  echo ""

  case $varCho in
    1)  ./2-2-4.sh  ;;
    2)  ./2-2-7.sh  ;;
    3)  ./2-2-9.sh  ;;
    4)  echo -e "\nThank you!"  ;;
    *)  echo -e "\a\nTry other options!!"  ;;
  esac
  echo -e "Press any key to continue....\n\n"
  read -s -n 1
  clear
done

exit 0