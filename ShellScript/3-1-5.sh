#! /bin/bash
# Description: 3-1-5
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

function printMulti()
{
  varTest=0
  i=0
  until [ $varTest -gt 1000 ]
  do
    let varTest=$1*$i
    [ $varTest -le 1000 ] && echo -n "$varTest "
    let i=$i+1
  done
}

echo "----------------------------------"
echo "    Print the Multiples < 1000    "
echo "----------------------------------"
read -p "  Input:  " varIn
echo "  Output: "
printMulti $varIn
echo ""
read -s -n 1 -p "press any key to leave...."
echo ""

exit 0