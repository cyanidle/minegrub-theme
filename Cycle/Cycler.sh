#!/bin/bash
# Set working directory to script's location
cd "${0%/*}"
count=0
for f in enumerated/*.png; do
	count=$((++count))
done
current_number=$(cat current_number) 
wanted_number=$((++current_number))
# Linus' Birthday logic
# If birthday file is present, check the date, and use it as the logo if it's Linus's birthday. End the script early.
if [[ $(date +%d%m) -eq 2812 ]]; then
	cp ./birthday.png ../logo.png
	exit
fi
echo count = $count
echo wanted_number = $wanted_number
if (( wanted_number >= count - 1 )); then
	echo Resetting current_number
	wanted_number=0
fi
cp enumerated/$wanted_number.png ../logo.png
echo $wanted_number > current_number

