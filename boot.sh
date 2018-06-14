#!/bin/bash

set -e

#Start openhim-core using dockerize so that we can wait for mongodb to be ready
dockerize -wait tcp://openhim-mongo:27017 -timeout 15s ./start-openhim.sh run &

#Start the mediator using dockerize so that we can wait for openhim core to be ready
dockerize -wait tcp://localhost:5002 -timeout 15s mediator/start-mediator.sh run