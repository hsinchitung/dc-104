#! /bin/bash
# Description: 2-1-13
# Writed by chi
# Version: v1.00

read -p "Enter hight (e.g. 7):  " varWidth

for (( i=1 ; i<=$varWidth ; i++ ))
do
  for (( j=1 ; j<=$varWidth ; j++ ))
  do
    echo -n "*"
  done

  echo -n -e "\r"

  for (( k=$i ; k<$varWidth ; k++ ))
  do
    echo -n " "
  done

  echo ""
done

exit 0