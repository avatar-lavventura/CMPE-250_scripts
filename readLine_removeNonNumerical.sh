#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    #echo "$line"
    prefix="project1"
    foo=${line#$prefix}        
    new=$(tr -dc '0-9' <<< $foo)
    echo $new
done < "$1"

#To run:
#bash readLine_removeNonNumerical.sh text.txt
