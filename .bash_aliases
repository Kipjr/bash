alias listen-docker='netstat -plutn | grep docker'
alias listen='netstat -plutn | grep LISTEN'
alias ufw-status='ufw status verbose | head -n 4 && ufw status numbered | grep -A100 To'
alias ufw-read='/home/pi/alias_ufw-read.sh'
alias get-docker='/home/pi/alias_get-docker.sh'
alias apt-get='/home/pi/alias_apt-get.sh'
alias cls="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}'"
