#!/bin/bash

sudo apt-get purge 'php*' -y
sudo apt-get autoremove --purge wordpress -y
sudo apt-get remove --purge mysql-server mysql-client mysql-common -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get purge apache2 -y
sudo apt autoremove -y
sudo rm /etc/wordpress/config-10.0.6.142.php
sudo rm /etc/apache2/sites-available/wordpress.conf
sudo apt-get remove -y --auto-remove salt-minion
sudo apt-get purge -y --auto-remove salt-minion
sudo apt-get purge -y --auto-remove munin-node
sudo rm /etc/munin/munin-node.conf
