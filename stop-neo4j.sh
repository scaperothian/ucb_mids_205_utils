#!/bin/bash

# Send a command to the session
cd /home/w205/docker/clusters/anaconda_neo4j
echo "calling docker-compose down"
docker-compose down 
echo "killing off the tmux sessions"
tmux kill-session -t neo4j
tmux kill-session -t jupyter
