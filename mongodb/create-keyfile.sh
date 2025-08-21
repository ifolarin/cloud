#!/bin/bash
openssl rand -base64 756 > ./data/keyfile.pem
chmod 400 ./data/keyfile.pem
ls -alh ./data/keyfile.pem