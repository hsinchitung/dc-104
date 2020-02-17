#! /bin/bash
# Description: 3-1-8
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

funBinary()
{
  echo "obase=2;$1" | bc
  echo ""
  read -s -n 1 -p " press any key to leave...."
  echo ""
}

echo "-------------------------"
echo "    Convert to Binary    "
echo "-------------------------"
read -p " Input:  " varIn
echo -n " Output: "

funBinary $varIn

exit 0