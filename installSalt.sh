#!/bin/bash

if ! dpkg -l salt-minion;
  then
    curl -L https://bootstrap.saltstack.com -o install_salt.sh
    sudo sh install_salt.sh
    if ! grep -Fxq "master: 10.0.6.141" "/etc/salt/minion";
      then
        echo "master: 10.0.6.141" >> /etc/salt/minion
        echo "id: Wordpress" >> /etc/salt/minion
        service salt-minion restart
        echo "Salt installed succesfully"
    fi
else
  echo "Salt is already installed"
fi
