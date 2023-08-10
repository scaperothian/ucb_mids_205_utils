#!/bin/bash

# Create a new tmux session
tmux new-session -d -s redis 

# Send a command to the session
tmux send-keys -t redis "cd /home/w205/docker/clusters/anaconda_redis" Enter
tmux send-keys -t redis "docker-compose up" Enter

# Detach from the session
tmux detach-client -s redis

echo "pause while redis comes up."
sleep 2

tmux new-session -d -s jupyter

tmux send-keys -t jupyter "cd /home/w205/docker/clusters/anaconda_redis" Enter
tmux send-keys -t jupyter "docker-compose exec anaconda jupyter notebook --notebook-dir=/user --ip='*' --port=8888 --no-browser --allow-root" Enter

echo "pause while jupyter comes up."
sleep 4

tmux attach-session -t jupyter
