#!/bin/bash


printf "%-20s%10s%10s\n" "TIMESTAMP" "TEMP(degC)" "TEMP(F)"
printf "%20s\n" "--------------------------------"

while true
do
	tempC=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
	tempF=$(echo "scale=2; 1.8 *$tempC + 32" | bc)
	timestamp=$(date +"%F %R:%S")
	printf "%-20s%10s%10s\n" "$timestamp" "$tempC" "$tempF"
	sleep 1
done
