#!/bin/bash
tmpfile=/var/log/messages

DIR=${1:-$tmpfile}   # Defaults to /var/log/messages
# Jun 29 12:50:31 docker kernel: [85094.482765] [UFW BLOCK] IN=eth0 OUT= MAC=dc:a6:32:08:00 SRC=192.168.X.Y DST=192.168.A.B LEN=48 TOS=0x00 PREC=0x00 TTL=128 ID=9819 DF PROTO=TCP SPT=60262 DPT=1234 
# WINDOW=64240 RES=0x00 SYN URGP=0
# 12:50:31 |  BLOCK - eth0:192.168.X.Y:60262 to  192.168.A.B:1234/TCP


#Jun 30 08:23:13 docker kernel: [64819.986837] [UFW BLOCK] IN=eth0 OUT= MAC=01:00:5e:00:00:fb:44:91:60:2c:c5:f9:08:00 SRC=192.168.1.21 DST=224.0.0.251 LEN=32 TOS=0x00 PREC=0x00 TTL=1 ID=9 PROTO=2
#

tail -n 250 $DIR > /tmp/tailfile

infile=/tmp/tailfile

while read line; do
ti=$(echo "$line" |  cut -c8-15)

type="${line##*[}"
type="${type%%]*}"

ifa="${line##*IN=}"
ifa="${ifa%%' '*}"

ip="${line##*SRC=}"
ip="${ip%%' '*}"

out="${line##*OUT=}"
out="${out%%' '*}"

dst="${line##*DST=}"
dst="${dst%%' '*}"

pr="${line##*PROTO=}"
pr="${pr%%' '*}"
if [[ "${pr}" =~ [^a-zA-Z] ]]; then 
pr=''
fi

dpt="${line##*DPT=}"
dpt="${dpt%%' '*}"
if [[ "${dpt}" =~ [^0-9] ]]; then 
dpt=''
fi

spt="${line##*SPT=}"
spt="${spt%%' '*}"
if [[ "${spt}" =~ [^0-9] ]]; then 
spt=''
fi

  echo "$ti |  $type - $ip:$spt to $dst:$dpt/$pr"
done < $infile
