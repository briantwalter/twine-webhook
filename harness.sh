#!/bin/bash

#
# harness.sh		Twine sensor emulator
# version		0.0.1
# author		Brian Walter @briantwalter
# description		Uses cURL and random values to 
#			simulate a HTTP POST from Twine rule
#
# Possible Values:
# [temperature]		0-150
# [shaking/still]	"shaking" or "still"
# [orientation]		"top", "bottom", "front", "back, "left", or "right"
#

APIKEY=$1
APIEND=http://10.0.1.229:8008
CURL="/usr/bin/curl --data"
TEMP=`echo $RANDOM | cut -c 1,2`
ACEL=`shuf -e -n 1 shaking still`
ORIE=`shuf -e -n 1 top bottom front back left right`

echo "DEBUG: APIEND is ${APIEND}"
echo "DEBUG: TEMP is  ${TEMP}"
echo "DEBUG: ACEL is  ${ACEL}"
echo "DEBUG: ORIE is  ${ORIE}"

if [ "${1}" == "" ]; then
  echo "usage: ${0} <APIKEY>"
  exit 1
fi
# if we got an API key run the POST
${CURL} "key=${APIKEY}&temp={$TEMP}&acel=${ACEL}&orie=${ORIE}" ${APIEND}
