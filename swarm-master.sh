#!/bin/bash
sudo docker swarm init --advertise-addr=IP.DO.SEU.MASTER
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
