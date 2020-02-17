#! /bin/bash
# Description: 3-1-9
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

declare -a aIP
declare -a aMASK=(0 0 0 0)
varCk=0

function banner()
{
  echo "------------------------------------------------------------"
  echo "                   IP Address Information"
  echo "------------------------------------------------------------"
  read -p "  Enter IPv4 (e.g. 10.120.40.102/24): " varIP
}

function departIP()
{
  IP=${varIP%/*}
  MASK=${varIP#*/}
  IP=$(sed 's/\./ /g' <<< $IP)

  read aIP[0] aIP[1] aIP[2] aIP[3] <<< $IP
}


function ckIP()
{
  if [ ${aIP[0]} -lt 256 ] && [ ${aIP[1]} -lt 256 ] && [ ${aIP[2]} -lt 256 ] && [ ${aIP[3]} -lt 256 ] 2> /dev/null
  then
    if ((1<=${aIP[0]} && ${aIP[0]}<=127))
    then
      [ ${aIP[0]} == 127 ] && echo "127.0.0.1 is loopback address" && return 127
      if ((8<=$MASK && $MASK<=31))
      then
        varCk=1
        return 0
      else
        echo "!!!!Wrong Mask Input!!!!"
      fi
    elif ((128<=${aIP[0]} && ${aIP[0]}<=191))
    then
      if ((16<=$MASK && $MASK<=31))
      then
        varCk=1
        return 0
      else
        echo "!!!!Wrong Mask Input!!!!"
      fi
    elif ((192<=${aIP[0]} && ${aIP[0]}<=223))
    then
      if ((24<=$MASK && $MASK<=31))
      then
        varCk=1
        return 0
      else
        echo "!!!!Wrong Mask Input!!!!"
      fi
    else
      echo "Your IP is being used by ALIEN"
    fi
  else
    echo "!!!!Wrong IP Input!!!!"
  fi
}

function infoNet()
{
  let MN=$MASK/8 MH=$MASK%8
  for (( i=0 ; i<$MN ; i++ ))
  do
    aMASK[i]=255
  done
  [ $MN -lt 4 ] && aMASK[$MN]=$(echo "256-2^(8-$MH)" | bc)

  for (( i=0 ; i<4 ; i++ ))
  do
    #subnet
    aSubnet[i]=$((${aIP[i]}&${aMASK[i]}))
  done
}

until [ $varCk -eq 1 ]
do
  banner
  departIP
  ckIP
done
infoNet

echo -e "\n  Subnet: ${aSubnet[0]}.${aSubnet[1]}.${aSubnet[2]}.${aSubnet[3]}/$MASK"

echo ""
read -s -n 1 -p "....press any key to leave...."
echo ""

exit 0
