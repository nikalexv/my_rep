#!/bin/bash

#city input validation
if [ -n "$1" ]
then
# json stdout in tempory file 
curl -s wttr.in/$1?format=j1 > test.$$
#jq parser 
 temperature=`jq -r '.current_condition[0].FeelsLikeC' test.$$`
 humidity=`jq -r '.current_condition[0].humidity' test.$$`
 echo "Its $temperature degrees Celsius outside with $humidity% of humidity"
#delete tempory file 
 rm -rf test.$$
else
 echo "No parameters found"
fi 
