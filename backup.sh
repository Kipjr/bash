#!/bin/bash
var=$(date +"%FORMAT_STRING")
now=$(date +"%m_%d_%Y")
printf "%s\n" $now
today=$(date +"%Y-%m-%d")
tar -cf archive_$today.tar /home/pi/  # Create archive.tar from files foo and bar.
