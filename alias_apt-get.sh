#!/bin/bash
echo $@ >> /home/pi/apt.log
apt-get $@

