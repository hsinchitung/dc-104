#! /bin/bash
# Description: 2-2-7
# Writed by chi
# Version: v1.00

echo "************************************"
echo "*    Interactive BMI Calculator    *"
echo "************************************"

read -p " Please enter your weight(kgw): " varWeight
read -p " Please enter your height(cm): " varHeight

./2-2-7-BMI.sh $varHeight $varWeight

exit 0