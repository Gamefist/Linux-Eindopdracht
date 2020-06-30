#!/bin/bash

curl -L https://bootstrap.saltstack.com -o install_salt.sh

sudo sh install_salt.sh -A 10.0.6.141

service salt-minion restart

echo "Minion installed succesfully
