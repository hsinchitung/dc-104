#! /bin/bash
# Description: 3-2-4, modified from hostChecker.sh, ONLY FOR UBUNTU
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

sudo apt install ipcalc &> /dev/null

declare -a aIPmin
declare -a aIPmax
ori_IFS=$IFS

echo "======= LAN HOST CHECKER ======="
echo " Enter IPv4 and network prefix"
read -p "        " IP

MASK=$(ipcalc $IP | grep "Netmask" | awk '{print $2}')
NET=$(ipcalc $IP | grep "Network" | awk '{print $2}')
IPmin=$(ipcalc $IP | grep "HostMin" | awk '{print $2}')
IPmax=$(ipcalc $IP | grep "HostMax" | awk '{print $2}')

IFS="."
read aIPmin[0] aIPmin[1] aIPmin[2] aIPmin[3] <<< $IPmin
read aIPmax[0] aIPmax[1] aIPmax[2] aIPmax[3] <<< $IPmax
IFS=$ori_IFS

echo "================================"

for (( a=${aIPmin[0]} ; a<=${aIPmax[0]} ; a++ ))
do
  for (( b=${aIPmin[1]} ; b<=${aIPmax[1]} ; b++ ))
  do
    for (( c=${aIPmin[2]} ; c<=${aIPmax[2]} ; c++ ))
    do
      for (( d=${aIPmin[3]} ; d<=${aIPmax[3]} ; d++ ))
      do
        IPping="$a.$b.$c.$d"
        printf "%-7s %-15s %-2s" $(echo -n "pinging $IPping .. ")
        ping -c 1 -i 0.2 -W 1 $IPping &> /dev/null

        if [ $? -eq 0 ]
        then
          echo "ONLINE"
        else
          echo ""
        fi
      done
    done
  done
done

echo "=========== SCAN END ==========="

exit 0