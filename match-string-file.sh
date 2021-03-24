#!/bin/bash
#set -x

# ./test-file-string [-l location] [--location location] [-h] [--help]

usage(){
  echo "usage: $0 [-l location] [--l location] [-h] [--help]"
  echo "Examples: "
  echo "$0 -l /etc"
  echo "$0 --help"
  echo
  exit 1
}


while [[ "${#}" -ge 0 ]]
do
  case "${1}" in 
    -l|--location)
       LOCATION="${2}"
       if [[ -s "${LOCATION}" ]]; then
         read -p "Enter your string: " ENTERED_STRING
         grep -iw $ENTERED_STRING $LOCATION &> /dev/null
         if [[ "${?}" -eq 0 ]]; then
           echo "${ENTERED_STRING} exists in ${LOCATION}"
         else
           echo "${ENTERED_STRING} doesn't exists."
           exit 1
         fi
       else 
         echo "file doesn't exist or it is a Empty file"
         exit 1
       fi
       break
       ;;
       
    -h|--help )
       shift
       usage
      ;;
     
     * )
      usage
      ;;
     
  esac
done
 
exit 0
     
