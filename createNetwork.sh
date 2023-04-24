#!/bin/bash
cd network/fabric-network

./network.sh down

docker kill $(docker ps -aq)
docker rm $(docker ps -aq)

export COMPOSE_PROJECT_NAME=net


./network.sh up createChannel -ca -s couchdb

./network.sh deployCC -ccn supplychain -ccp ../../chaincode -ccl typescript


cd $HOME/hyper-test-network/hyperledger-supply-chain/web-app/server/fabric


rm -R wallet/*

npm i 


node enrollAdmin.js

node registerUsers.js


cd $HOME/hyper-test-network/hyperledger-supply-chain/web-app/server


node app