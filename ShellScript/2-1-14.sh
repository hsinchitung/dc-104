#! /bin/bash
# Description: 2-1-14
# Writed by chi
# Version: v1.00

read -p "Enter hight (e.g. 7):  " varWidth

for (( i=1 ; i<=$varWidth ; i++ ))
do
  for (( j=1 ; j<=$varWidth ; j++ ))
  do
    echo -n "*"
  done

  if [ $i != 1 ] && [ $i != $varWidth ]
  then
    echo -n -e "\r*"
    for (( k=1 ; k<=$varWidth-2 ; k++ ))
    do
      echo -n " "
    done
    echo ""
  else
    echo ""
    [ $i == $varWidth ] && exit 0
  fi
done

exit 0