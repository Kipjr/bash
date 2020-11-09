#!/bin/bash
iptables -I INPUT 1 -j LOG --log-prefix "[LOG INPUT] " --log-level 6 -m limit --limit 20/min --limit-burst 25
iptables -I FORWARD 1 -j LOG --log-prefix "[LOG FRWRD] " --log-level 6 -m limit --limit 20/min --limit-burst 25
iptables -I OUTPUT 1 -j LOG --log-prefix "[LOG OUTPT] " --log-level 6 -m limit --limit 20/min --limit-burst 25
iptables -t nat -I PREROUTING 1 -j LOG --log-prefix "[LOG NTPRE] " --log-level 6 -m limit --limit 20/min --limit-burst 25
iptables -t nat -I POSTROUTING 1 -j LOG --log-prefix "[LOG NTPST] " --log-level 6 -m limit --limit 20/min --limit-burst 25
iptables -t nat -I OUTPUT 1 -j LOG --log-prefix "[LOG NTOUT] " --log-level 6 -m limit --limit 20/min --limit-burst 25






