#! /bin/bash
# Description: 3-2-5
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

export pingPath=$(pwd)/3-2-5.d/pingList
export logPath=$(pwd)/3-2-5.d/log
export switchPath=$(pwd)/3-2-5.d/switch
export tempPingList=$(pwd)/3-2-5.d/tempPingList
export MonitorPath=$(pwd)/3-2-5.d/monitor

mkdir -p ./3-2-5.d
touch $pingPath $logPath $switchPath $MonitorPath
echo -n "0" > $switchPath

function sortPingList()
{
  sort -u $pingPath > $tempPingList
  cat $tempPingList >  $pingPath
  rm $tempPingList
}

function MonitorGenerator()
{
echo -e -n '
#! /bin/bash
# Description: Monitor script for 3-2-5.sh
# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)
# Version: v1.00

varSwitch=$(cat $switchPath)

until [ $varSwitch -eq 0 ]
do
  varMaxLine=$(grep -c "......." $pingPath)

  for ((i=1 ; i<=$varMaxLine ; i++))
  do
    ping -c 1 -i 0.2 -W 1 $(sed -n ${i}p $pingPath) &> /dev/null
    [ $? -eq 1 ] && echo -e "$(sed -n ${i}p $pingPath)\t$(date)" >> $logPath
  done

  varSwitch=$(cat $switchPath)
done

exit 0
' > $MonitorPath
}

MonitorGenerator

clear
varLoop=1
until [ $varLoop -eq 0 ]
do
  echo "========= HOST MONITOR ========="
  echo "---------------------Settings --"
  echo " (1) List hosts (*) Quit"
  echo " (2) Add        (3) Remove"
  echo " (4) Start      (5) Stop"
  echo "------------------------ Logs --"
  echo " (6) View       (7) Clear"
  echo "================================"
  read -n 1 -p " Select function: " varCho
  echo ""

  sortPingList

  case ${varCho:-5} in
    1) # List host
      less $pingPath
      echo ""
    ;;
    2) # Add
      cat $pingPath
      read -p "Enter IPv4: " addIP
      case ${addIP:-0} in
        0)
          echo "!!Bad Input!!"
          echo ""
          return 1
        ;;
        *)  echo $addIP >> ./3-2-5.d/pingList  ;;
      esac
    ;;
    3) # Remove
      read -p "Enter IPv4: " rmIP
      case ${rmIP:-0} in
        0)
          echo "Remove none"
          echo ""
        ;;
        *)
          cat $pingPath
          $(sed -i "/^${rmIP}$/d" $pingPath)
        ;;
      esac
    ;;
    4) # Start
      echo -n "1" > $switchPath
      echo "....start monitoring...."
      bash $MonitorPath &
    ;;
    5) # Stop
      echo "....stop monitoring...."
      echo -n "0" > $switchPath
    ;;
    6) # View
      less $logPath
      echo ""
    ;;
    7) # Clear
      echo -n "" > $logPath
    ;;
    *) # Quit
      varLoop=0
      echo ""  ;;
  esac
  read -s -n 1 -p "....press any key to continue...."
  echo -e "\n"
done

exit 0