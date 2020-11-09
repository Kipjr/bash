#!/bin/bash
input=$1
container=$2
network=$3

if [[ "$input" == "all" ]]; then
     echo "All containers:"
     for N in $(docker container ls | awk 'NR>=2' | cut -c1-12 );  do echo "$(docker inspect -f '{{.Config.Hostname}}' ${N}) $(docker inspect -f '{{range $i, $value := .NetworkSettings.Networks}} [{{$i}}:{{.IPAddress}}]{{end}}' ${N})"; done

elif [[ "$input" == "container" ]]; then
      echo "This container:$container"
     if [[ "${network}" ]]; then
          docker inspect --format='{{range $i, $value := .NetworkSettings.Networks}}{{$i}}: {{println .IPAddress}}{{end}}' $container | grep $network
    else 
         docker inspect --format='{{range $i, $value := .NetworkSettings.Networks}}{{$i}}: {{println .IPAddress}}{{end}}' $container
    fi
else
     echo "This docker-compose:"
     for N in $(docker-compose ps -q) ; do echo "$(docker inspect -f '{{.Config.Hostname}}' ${N}) $(docker inspect -f '{{range $i, $value := .NetworkSettings.Networks}} [{{$i}}:{{.IPAddress}}]{{end}}' ${N})"; done
fi
        #https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host/62721279#62721279
        # docker container ls | awk 'NR>=2' | cut -c1-12 
        # docker inspect --format='{{range $i, $value := .NetworkSettings.Networks}}{{if eq $i "docker-cinebox-dev2_cinebox_net"}}{{.IPAddress}}{{end}}{{end}}' openpyn 
        # nsenter -n -t $(docker inspect --format {{.State.Pid}} transmission) ip route add 192.168.6.0
        #nsenter -n -t $(docker inspect --format {{.State.Pid}} transmission) ip route del default
        #nsenter -n -t $(docker inspect --format {{.State.Pid}} transmission) ip route add default via $(docker inspect --format='{{range $i, $value := .NetworkSettings.Networks}}{{if eq $i "docker-cinebox-dev2_cinebox_net"}}{{.IPAddress}}{{end}}{{end}}' openpyn) dev eth0
        #  for N in $(docker container ls | awk 'NR>=2' | cut -c1-12 ); do echo "$(docker inspect -f '{{$H :=.Config.Hostname}}{{range $i, $value := .NetworkSettings.Networks}}{{.IPAddress}} {{($H)}}/{{println $i}}{{end}}' ${N})"; done
        # 192.168.8.2 pihole/docker-pihole_net
        # 192.168.9.2 pihole/intranet
        # 192.168.8.10 004c02145093/docker-nginx-proxy_net
        # 192.168.8.11 nginx-proxy/docker-nginx-proxy_net
        # 192.168.9.4 nginx-proxy/intranet
        # 192.168.8.66 phpmyadmin/docker-web_net        
        # for N in $(docker container ls | awk 'NR>=2' | cut -c1-12 );  do echo "$(docker inspect -f '{{.Config.Hostname}}' ${N}) $(docker inspect -f '{{range $i, $value := .NetworkSettings.Networks}} [{{$i}}:{{.IPAddress}}]{{end}}' ${N})"; done
        #pihole  [docker-pihole_net:192.168.8.2] [intranet:192.168.9.2]
        #004c02145093  [docker-nginx-proxy_net:192.168.8.10]
        #nginx-proxy  [docker-nginx-proxy_net:192.168.8.11] [intranet:192.168.9.4]

      #sudo ufw route allow in on eth0 out  on  eth1  to  10.0.0.0/8 port 80  from 192.168.0.0/16


      #for N in $(docker-compose ps -q) ; do echo "$(docker inspect -f '{{.Config.Hostname}}' ${N}) $(docker inspect -f '{{range $i, $value := .NetworkSettings.Networks}} [{{$i}}:{{.IPAddress}}]{{end}}' ${N})"; done


        #THE SOLUTION for routing through container!!! 
        # https://stackoverflow.com/questions/36882945/change-default-route-in-docker-container
        # https://github.com/ekristen/openvpn-router


