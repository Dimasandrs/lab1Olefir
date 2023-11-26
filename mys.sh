#!/bin/bash
while [ 1 ]
do
echo "This work was create by Olefir Dmitry Konstantinovich from group 710-1"
echo "Current directory:"
pwd
direct=$(ls)
echo $direct
if [ -z "$direct" ];
	then 
	echo "Directory is empty"
	exit
else echo "Directory isn't empty"
fi
code="1"
while [ "$code" == "1" ]
do
read -p "Enter file name which you want to find" fileName
file=$(find -name "$fileName")
if [ -z "$file" ];
	then 
	echo "This file was not found, please,  try again";
else echo "File was found" 
code="0";
fi
done
read -p "Enter the date. Firstly enter the year: " year
while [[ $year -lt 1970 ]] || [[ $year -gt 2023 ]]
do
	read -p "Wrong year, enter again: " year
done

read -p "Now enter the month: " month
while [[ $month -lt 1 ]] || [[ $month -gt 12 ]]
do
	read -p "Wrong month, enter again: " month
done
read -p "And enter the day: " day

while [[ $day -lt 1 ]] || [[ $day -gt 31 ]]
do
	read -p "Wrong day, enter again:" day
done
if [ "$(date --date=$(stat -c '%x' "$file" | cut -c 1-10) +%s)" -gt "$(date --date="$year-$month-$day" +%s)" ];
	then
	echo "File was opened after $year-$month-$day"
else 
	echo "File was not opened after $year-$month-$day"
	exit 120
fi
read -p "Do you want to stop program? (If Y-stop program, anything else - continue)" chose
if [[ "$chose" == "y" || "$chose" == "Y" ]];
then exit
fi
done
