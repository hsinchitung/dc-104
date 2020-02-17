#! /bin/bash
# Description: 2-2-9-transA
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

varFunction=$1
varTransA=0

read -p "   Enter areas: " varArea

case $varFunction in
  1)  varTransA=$(echo "scale=4;(121*$varArea)/400" | bc)  ;;
  2)  varTransA=$(echo "scale=4;(400*$varArea)/121" | bc)  ;;
esac

echo -e ">> $varTransA"

exit 0