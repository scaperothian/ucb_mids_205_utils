#!/bin/bash

# Create a new tmux session
tmux new-session -d -s neo4j 

# Send a command to the session
tmux send-keys -t neo4j "cd /home/w205/docker/clusters/anaconda_neo4j" Enter
tmux send-keys -t neo4j "docker-compose up" Enter

# Detach from the session
tmux detach-client -s neo4j

echo "pause while neo4j comes up."
sleep 2

echo "pause while postgres comes up."
sleep 2

tmux new-session -d -s jupyter

tmux send-keys -t jupyter "cd /home/w205/docker/clusters/anaconda_neo4j" Enter
tmux send-keys -t jupyter "docker-compose exec anaconda jupyter notebook --notebook-dir=/user --ip='*' --port=8888 --no-browser --allow-root" Enter

echo "pause while jupyter comes up."
sleep 2

tmux attach-session -t jupyter
