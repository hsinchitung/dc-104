#! /bin/bash
# Description: start a ss file
# Writed by chi
# Version: v2.00 Now can use 2 ways

varInput=$1

function action()
{
  echo -e "#! /bin/bash\n# Description: $1\n# Writed by chi (hsinchitung@iiietc.ncu.edu.tw)\n# Version: v1.00\n\n\n\nexit 0" > ./$1.sh

  chmod 755 ./$1.sh

  vim ./$1.sh
}

case ${varInput:-0} in
  0)
    read -p "Enter script name: " varInput
    action $varInput
  ;;
  *)
    action $varInput
  ;;
esac


exit 0
