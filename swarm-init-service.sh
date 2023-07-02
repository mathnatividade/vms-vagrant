#!/bin/bash
docker volume create app-swarm
docker node update --availability pause master
docker service create --name webserver --replicas 15 -dt -p 80:80 --mount type=volume,src=app-swarm,dst=/usr/local/apache2/htdocs/ httpd