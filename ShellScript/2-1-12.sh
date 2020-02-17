#! /bin/bash
# Description: 2-1-12
# Writed by chi
# Version: v1.00

read -p "Enter hight (e.g. 7):  " varWidth

for (( i=1 ; i<=$varWidth ; i++ ))
do
  for (( j=$varWidth ; j>=$i ; j-- ))
  do
    echo -n "*"
  done

  echo ""
done

exit 0
