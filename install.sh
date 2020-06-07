#!/bin/bash

cnt=$(cat /etc/os-release | grep "Ubuntu 18.04."  | head -1 | wc -l)

if [[ "$cnt" != "1" ]]
then
echo "This is for Ubuntu 18.04 only."
exit 1
fi

echo "Removing if there is any old docker package"
sudo apt-get -y remove docker docker-engine docker-cli docker-ce-cli docker.io
sudo snap remove docker

echo "Updating all linux packages"
sudo apt-get update

echo "Starting the docker installation"
sudo apt-get -y install docker.io

echo "Starting the docker service"
sudo systemctl start docker
sudo systemctl unmask docker

echo "Enabling the docker service"
sudo systemctl enable docker

#Lets setup virtual memory for elastic
echo "vm.max_map_count=262144" >/etc/sysctl.d/10-virtmemory-es.conf
sysctl -p /etc/sysctl.d/10-virtmemory-es.conf

echo "Docker successfully installed"
exit 0