#! /bin/bash
# Description: 2-2-7-BMI
# Writed by chi
# Version: v1.00

varBMI=$(echo "scale=2; $2/($1/100)^2" | bc)

echo "Your BMI is: $varBMI"

exit 0