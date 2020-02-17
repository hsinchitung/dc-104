#! /bin/bash
# Description: 2-2-9
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

echo "****************************"
echo "*   Area Unit Translator   *"
echo "****************************"
echo "*                          *"
echo "* (1)   Ping   >   m^2     *"
echo "* (2)    m^2   >   Ping    *"
echo "*                          *"
echo "****************************"

read -n 1 -p "   Select function: " varCho
echo ""

case $varCho in
  [[:digit:]])  ./2-2-9-transA.sh $varCho  ;;
  *)  echo "!! Wrong Input !!" && exit 1  ;;
esac

exit 0
