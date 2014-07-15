#!/bin/bash -x

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

APIEND=
APIKEY=
CURL="/usr/bin/curl --data"
TEMP=`echo $RANDOM | cut -c 1,2`
ACEL=`shuf -e -n 1 shaking still`
ORIE=`shuf -e -n 1 top bottom front back left right`

echo "DEBUG: TEMP is  ${TEMP}"
echo "DEBUG: ACEL is  ${ACEL}"
echo "DEBUG: ORIE is  ${ORIE}"

${CURL} "key=${APIKEY}&temp={$TEMP}&acel=${ACEL}&orie=${ORIE}" ${APIEND}
