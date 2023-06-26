#!/bin/bash

# Send a command to the session
cd /home/w205/docker/clusters/anaconda_postgres
echo "calling docker-compose down"
docker-compose down 
echo "killing off the tmux sessions"
tmux kill-session -t jupyter
tmux kill-session -t postgres
