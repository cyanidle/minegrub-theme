#!/bin/bash
# Set working directory to script's location
cd "${0%/*}"
count=0
for f in *.png; do
	count=$((++count))
done
current_number=$(cat current_number) 
wanted_number=$((++current_number))
# Linus' Birthday logic
# If birthday file is present, check the date, and use it as the logo if it's Linus's birthday. End the script early.
if [[ $(date +%d%m) -eq 2812 ]]; then
	rm ../logo.png
	cp ./birthday.png ../logo.png
	exit
fi
if (( wanted_number > count )); then
	wanted_number=0
fi
# Remove logo from main folder and rename it to sit at bottom of the rotation, put the lowest value image back in its place.
mv ../logo.png $(printf %02d $(($count))).png
mv ./00.png ../logo.png
