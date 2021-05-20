#!/bin/bash

#Проверка ввода параметра скрипта 
if [ -n "$1" ]
then
#вывод данных во временный файл
 curl -s wttr.in/$1?format=j1 > test.$$
#c помощью библиотеки jq находим необходимые данные в json   
 temperature=`jq -r '.current_condition[0].FeelsLikeC' test.$$`
 humidity=`jq -r '.current_condition[0].humidity' test.$$`
 echo "Its $temperature degrees Celsius outside with $humidity% of humidity"
#удаляем временный файл
 rm -rf test.$$
else
 echo "No parameters found"
fi 
