#!/bin/bash

# Create a new tmux session
tmux new-session -d -s mongo 

# Send a command to the session
tmux send-keys -t mongo "cd /home/w205/docker/clusters/anaconda_mongo" Enter
tmux send-keys -t mongo "docker-compose up" Enter

# Detach from the session
tmux detach-client -s mongo

echo "pause while mongo comes up."
sleep 2

tmux new-session -d -s jupyter

tmux send-keys -t jupyter "cd /home/w205/docker/clusters/anaconda_mongo" Enter
tmux send-keys -t jupyter "docker-compose exec anaconda jupyter notebook --notebook-dir=/user --ip='*' --port=8888 --no-browser --allow-root" Enter

echo "pause while jupyter comes up."
sleep 4

tmux attach-session -t jupyter
