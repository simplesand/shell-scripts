#!/bin/bash

HOST=
ping -c3 $1 &> /dev/null

if [[ "${?}" -ne 0 ]]
  echo "systems are not live"
  exit 1
fi

JAVA_COMMAND="java --version" &> /dev/null
$JAVA_COMMAND

if [[ "${?}" -ne 0 ]]; then
  echo "java is not installed"
  exit 1
fi

wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/16+36/7863447f0ab643c585b9bdebf67c69db/jdk-16_linux-x64_bin.tar.gz
tar xzf jdk-16_linux-x64_bin.tar.gz -C /opt/
mv jdk-16_linux-x64_bin java16

if [[ "${?}" -ne 0 ]]; then
  echo "renaming doesn't succeeded"
  exit 1
fi

source ~/.bashrc

java --version &> /dev/null

if [[ "${?}" -ne 0 ]]; then
  echo "java successfully not installed"
  exit 1
fi

exit 0 
