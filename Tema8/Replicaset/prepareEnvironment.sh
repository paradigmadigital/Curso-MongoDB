#!/bin/bash

killall mongod
mkdir ./logs ./pids ./RS1 ./RS2 ./RS3
mongod -f ./mongoRs1.conf
mongod -f ./mongoRs2.conf
mongod -f ./mongoRs3.conf

