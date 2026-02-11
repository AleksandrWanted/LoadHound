#!/bin/bash
if [ -z $1 ]; then
  ip=127.0.0.0
else 
  ip=$1
fi

env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o build/bin/loadhound main.go
ssh ssh-a46daaa1d525@$ip "rm -f /home/ssh-a46daaa1d525/loadhound"
scp build/bin/loadhound ssh-a46daaa1d525@$ip:/home/ssh-a46daaa1d525/loadhound
ssh ssh-a46daaa1d525@$ip "rm -rf /home/ssh-a46daaa1d525/demo_prepare.toml"
ssh ssh-a46daaa1d525@$ip "rm -rf /home/ssh-a46daaa1d525/demo_test.toml"
ssh ssh-a46daaa1d525@$ip "rm -rf /home/ssh-a46daaa1d525/prepare_demo.sql"
scp my_tests/demo_prepare.toml ssh-a46daaa1d525@$ip:/home/ssh-a46daaa1d525
scp my_tests/demo_test.toml ssh-a46daaa1d525@$ip:/home/ssh-a46daaa1d525
scp scripts/sql/prepare_demo.sql ssh-a46daaa1d525@$ip:/home/ssh-a46daaa1d525