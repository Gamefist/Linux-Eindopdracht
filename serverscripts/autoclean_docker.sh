#!/bin/bash

sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli
sudo apt-get autoremove -y --purge docker-engine docker docker.io
docker-ce sudo rm -rf /var/lib/docker /etc/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo rm /etc/rsyslog.conf
sudo apt-get remove -y --auto-remove salt-minion
sudo apt-get purge -y --auto-remove salt-minion
sudo apt-get purge -y --auto-remove munin-node
sudo rm /etc/munin/munin-node.conf
